package com.controller;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.Employee;
import com.model.User;
import com.service.FetchService;

@Controller
public class ViewController {

	@Autowired
	private FetchService fetchService;

	/**
	 * login page request
	 * 
	 * @return
	 */
	@RequestMapping("/")
	public String login(HttpSession session) {
		if (session.getAttribute("USER") != null) {
			Employee[] employees = null;
			try {
				employees = fetchService.getEmployees();
			} catch (URISyntaxException e) {
				System.out.println(e.getMessage());
			}
			session.setAttribute("employees", employees);
			return "dashboard";
		}
		return "login";
	}

	/**
	 * login page request
	 * 
	 * @return
	 * @throws URISyntaxException
	 * @throws Exception
	 * @throws IOException
	 */
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public void login(User user, HttpSession session, HttpServletResponse response)
			throws URISyntaxException, IOException {
		User loggedInUser = null;
		try {
			loggedInUser = fetchService.getUser(user);
		} catch (URISyntaxException e) {
			System.out.println(e.getMessage());
		}

		session.setAttribute("USER", loggedInUser);

		if (loggedInUser == null)
			session.setAttribute("login_error", "Username or Password is incorrect");

		response.sendRedirect("/");
	}

	/**
	 * logout
	 * 
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("USER");
		session.removeAttribute("employees");
		return "login";
	}

	/**
	 * add employee get request
	 * 
	 * @return
	 */
	@RequestMapping("/add")
	public String addEmployee(HttpSession session) {
		if (session.getAttribute("USER") == null) {
			return "login";
		}
		return "add_form";
	}

	/**
	 * add employee
	 * 
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void addEmployee(Employee employee, HttpSession session, HttpServletResponse response) throws IOException {
		if (session.getAttribute("USER") != null) {
			try {
				boolean isAdded = fetchService.addEmployee(employee);
				if (isAdded) {
					session.setAttribute("isAdded", "Employee added Successfully...");
				} else {
					session.setAttribute("isAdded", "Can not add... Employee with same CODE is already present");
				}

			} catch (URISyntaxException e) {
				System.out.println(e.getMessage());
			}
		}
		response.sendRedirect("/");
	}

	/**
	 * update employee
	 * 
	 * @return
	 */
	@RequestMapping("/edit/{code}")
	public String editEmployee(@PathVariable("code") int code, HttpSession session) {
		if (session.getAttribute("USER") == null) {
			return "login";
		}
		session.setAttribute("code", code);

		Employee employee = null;
		try {
			employee = fetchService.getEmployee(code);
		} catch (URISyntaxException e) {
			System.out.println(e.getMessage());
		}
		session.setAttribute("currentEmployee", employee);

		return "edit_form";
	}

	/**
	 * update employee
	 * 
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public void editEmployee(Employee employee, HttpSession session, HttpServletResponse response) throws IOException {
		if (session.getAttribute("USER") != null) {
			try {
				Integer code = (Integer) session.getAttribute("code");
				fetchService.updateEmployee(employee, code);
			} catch (URISyntaxException e) {
				System.out.println( e.getMessage() );
			}
		}
		response.sendRedirect("/");
	}

}
