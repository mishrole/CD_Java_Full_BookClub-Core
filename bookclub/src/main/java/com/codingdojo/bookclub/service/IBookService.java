package com.codingdojo.bookclub.service;

import java.util.List;

import com.codingdojo.bookclub.entity.Book;

public interface IBookService {
	public abstract List<Book> getAll();
	public abstract Book save(Book book);
	public abstract Book find(Long id);
	public abstract Book update(Long id, Book book);
}
