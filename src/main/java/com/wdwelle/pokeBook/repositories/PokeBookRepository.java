package com.wdwelle.pokeBook.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.wdwelle.pokeBook.models.Expense;

public interface PokeBookRepository extends CrudRepository<Expense, Long>{
	List<Expense> findAll();
}
