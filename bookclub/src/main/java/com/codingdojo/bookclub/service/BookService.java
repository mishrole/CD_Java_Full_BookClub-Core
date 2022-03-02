package com.codingdojo.bookclub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.entity.Book;
import com.codingdojo.bookclub.repository.BookRepository;

@Service
public class BookService implements IBookService {
	
	@Autowired
	private BookRepository bookRepository;

	@Override
	public List<Book> getAll() {
		return bookRepository.findAll();
	}

	@Override
	public Book save(Book book) {
		return bookRepository.save(book);
	}

	@Override
	public Book find(Long id) {
		Optional<Book> savedBook = bookRepository.findById(id);
		
		if (savedBook.isPresent()) {
			return savedBook.get();
		}
		
		return null;
	}

	@Override
	public Book update(Long id, Book book) {
		Optional<Book> savedBook = bookRepository.findById(id);
		
		if (savedBook.isPresent()) {
			Book data = savedBook.get();
			data.setTitle(book.getTitle());
			data.setAuthor(book.getAuthor());
			data.setThoughts(book.getThoughts());
			
			return bookRepository.save(data);
		}
		
		return null;
	}

}
