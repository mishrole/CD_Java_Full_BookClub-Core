package com.codingdojo.bookclub.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.bookclub.entity.Book;
import com.codingdojo.bookclub.entity.User;
import com.codingdojo.bookclub.service.BookService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	/* JSP */
	
	@RequestMapping()
	public String home(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		
		List<Book> books = bookService.getAll();
		model.addAttribute("books", books);
		
		return "welcome";
	}
	
	@RequestMapping("/new")
	public String add(@ModelAttribute("book") Book book, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		
		return "new";
	}
	
	@RequestMapping("/{id}")
	public String show(HttpSession session, @PathVariable("id") Long id, Model model) {
		if (session.getAttribute("user") == null) {
			return "redirect:/logout";
		}
		
		Book result = bookService.find(id);
		model.addAttribute("book", result);
		
		return "show";
	}
	
	@RequestMapping("/{id}/edit")
	public String edit(HttpSession session, @PathVariable("id") Long id, Model model) {
		Book result = bookService.find(id);
		model.addAttribute("book", result);
		
		User loggedUser = (User) session.getAttribute("user");
		User bookOwner = (User) Hibernate.unproxy(result.getUser());
		
		if (bookOwner == null) {
			return "redirect:/books";
		}
		
		if (loggedUser == null) {
			return "redirect:/logout";
		}
		
		Long loggedId = loggedUser.getId();
		Long ownerId = bookOwner.getId();
		
		if (!(loggedId.equals(ownerId))) {
			return "redirect:/books";
		}
		
		return "edit";
	}
	
	/* Actions */
	
	@RequestMapping(method = RequestMethod.POST)
	public String create(HttpSession session, @Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "new";
		}
		
		User loggedUser = (User) session.getAttribute("user");
		
		if (loggedUser == null) {
			return "redirect:/logout";
		}
		
		book.setUser(loggedUser);
		bookService.save(book);
		
		return "redirect:/books";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public String update(HttpSession session, @PathVariable("id") Long id, @Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "edit";
		}
		
		User loggedUser = (User) session.getAttribute("user");
		
		if (loggedUser == null) {
			return "redirect:/logout";
		}
		
		bookService.update(id, book);
		return "redirect:/books";
	}
	
}
