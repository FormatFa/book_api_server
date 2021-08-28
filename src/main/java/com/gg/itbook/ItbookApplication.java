package com.gg.itbook;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
public class ItbookApplication {

	public static void main(String[] args) {
		SpringApplication.run(ItbookApplication.class, args);
	}

}
