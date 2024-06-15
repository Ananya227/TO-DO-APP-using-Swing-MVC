package com.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.springframework.ui.Model;
import com.entities.Todo;



@Controller

public class HomeCtrl  {
	
	@Autowired
	ServletContext context;
	  @RequestMapping("/home")
	   public String home(Model m)
	   {
		  
		  String str="home";
		  m.addAttribute("page" , str);
		 List<Todo> list = (List<Todo>) context.getAttribute("List");
		
		 m.addAttribute("todos" ,list);
		   return "home";
	   }
	  
	  @RequestMapping("/add")
	  public String addToDo(Model m)
	  {
		  
		  Todo t = new Todo();
		  
		  m.addAttribute("page" ,"add");
		  m.addAttribute("todo", t);
		  return "home";
	  }
	  @RequestMapping( value="/saveTodo",method=RequestMethod.POST)
	  public String saveTodo(@ModelAttribute("todo") Todo t,Model m)
	  {
		  System.out.println(t);
		  
		 List<Todo> list = (List<Todo>) context.getAttribute("List");
		
		 list.add(t);m.addAttribute("msg" ,"successfully addes..");
		  
		  return "home";	 
		  }

}
