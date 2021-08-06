package com.service;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import com.model.Employee;
import com.model.User;

/**
 * it is a service layer that provide the API call methods
 * 
 * @author vikantbhati
 *
 */
@Component
public class FetchService {
 
	private final RestTemplate restTemplate;
	private HttpHeaders headers;

	public FetchService() {
		restTemplate = new RestTemplate();
		headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
	}

	/**
	 * API call to fetch employees
	 * 
	 * @return
	 * @throws URISyntaxException
	 */
	public Employee[] getEmployees() throws URISyntaxException {
		String url = "http://localhost:9090/employee";
		URI uri = new URI(url);

		return restTemplate.getForEntity(uri, Employee[].class).getBody();
	}

	/**
	 * API call to fetch the user by providing credentials
	 * 
	 * @param user
	 * @return
	 * @throws URISyntaxException
	 */
	public User getUser(User user) throws URISyntaxException {
		String url = "http://localhost:9090/user";
		URI uri = new URI(url);

		HttpEntity<User> request = new HttpEntity<User>(user, headers);

		return restTemplate.postForEntity(uri, request, User.class).getBody();
	}

	/**
	 * Post API call to add employee
	 * 
	 * @param employee
	 * @return
	 * @throws URISyntaxException
	 */
	public boolean addEmployee(Employee employee) throws URISyntaxException {
		String url = "http://localhost:9090/employee";
		URI uri = new URI(url);

		HttpEntity<Employee> request = new HttpEntity<Employee>(employee, headers);

		try {
			restTemplate.postForEntity(uri, request, Employee.class).getBody();
		} catch (HttpClientErrorException e) {
			System.out.println(e.getMessage());
			return false;
		}

		return true;
	}

	/**
	 * API call to update the employee details
	 * 
	 * @param employee
	 * @param code
	 * @return
	 * @throws URISyntaxException
	 */
	public Employee updateEmployee(Employee employee, int code) throws URISyntaxException {
		String url = "http://localhost:9090/employee/" + code;
		URI uri = new URI(url);

		HttpEntity<Employee> request = new HttpEntity<Employee>(employee, headers);

		return restTemplate.postForEntity(uri, request, Employee.class).getBody();
	}

	/**
	 * API call to get the employee details
	 * 
	 * @param employee
	 * @param code
	 * @return
	 * @throws URISyntaxException
	 */
	public Employee getEmployee(int code) throws URISyntaxException {
		String url = "http://localhost:9090/employee/" + code;
		URI uri = new URI(url);
		return restTemplate.getForEntity(uri, Employee.class).getBody();
	}

}
