package com.unibuc.find_my_path;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = {"com/unibuc/find_my_path/model"})
public class FindMyPathApplication {

	public static void main(String[] args) {
		SpringApplication.run(FindMyPathApplication.class, args);
	}

}
