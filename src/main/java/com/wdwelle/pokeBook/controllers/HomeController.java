package com.wdwelle.pokeBook.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.wdwelle.pokeBook.models.Expense;
import com.wdwelle.pokeBook.services.ExpenseService;

public class HomeController {
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/expense")
	public String dashboard(Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	@PostMapping("/expense/create")
	public String processCreateForm(@Valid @ModelAttribute("newExpense")Expense newExpense, 
			BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		}else {
			expenseService.addExpense(newExpense);
			return "redirect:/expense";			
		}
	}
	
	@GetMapping("/expense/{id}")
	public String showOneExpense(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseService.findOneExpense(id);
		model.addAttribute("expense", expense);
		return "showOneExpense.jsp";
	}
	
	@GetMapping("/expense/{id}/edit")
	public String editExpense(@PathVariable("id")Long id, Model model) {
		Expense expense = expenseService.findOneExpense(id);
		model.addAttribute("expense", expense);
		return "editForm.jsp";
	}	
	
	@PutMapping("/expense/{id}/edit")
	public String processEditForm(@Valid @ModelAttribute("expense")Expense expense,
			BindingResult result, @PathVariable("id")Long id) {
		if(result.hasErrors()) {
			return "editForm.jsp";
		}else {
			expenseService.editExpense(expense);
			return "redirect:/dashboard";
		}
	}
	
	@DeleteMapping("/expense/{id}/delete")
	public String processDeleteGift(@PathVariable("id")Long id) {
		expenseService.deleteExpense(id);
		return "redirect:/expense";
	}
}
