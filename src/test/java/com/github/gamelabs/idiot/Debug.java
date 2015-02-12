package com.github.gamelabs.idiot;

import java.awt.Desktop;
import java.net.URI;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.context.ConfigurableApplicationContext;

class Debug {
	public static void main(final String[] args) throws Exception {
		try (ConfigurableApplicationContext run = new SpringApplicationBuilder(IdiotMoronGameApplication.class)
				.headless(false).run(args)) {
			Desktop.getDesktop().browse(new URI("http://localhost:8080/"));
			System.in.read();
		}
	}
}