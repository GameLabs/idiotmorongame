package com.github.gamelabs.idiot.util;

import java.awt.Desktop;
import java.awt.Desktop.Action;
import java.io.File;
import java.net.URI;

import lombok.extern.slf4j.Slf4j;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.gamelabs.idiot.IdiotMoronGameApplication;

import net.sourceforge.schemaspy.Config;
import net.sourceforge.schemaspy.SchemaAnalyzer;

/**
 * Use <a href="http://schemaspy.sourceforge.net/">SchemaSpy</a> to generate graphs from the current database schema.
 *
 * @author tbeek
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = IdiotMoronGameApplication.class)
@Slf4j
public class TestSchemaSpy {
	@Test
	@SuppressWarnings("static-method")
	public void runSchemaSpy() throws Exception {
		// Other hard coded values
		String dbtype = "src/test/resources/hsqldb-mem.properties";

		// Config options
		Config cfg = new Config();
		cfg.setDbType(dbtype);
		cfg.setHost("localhost");
		cfg.setUser("SA");
		cfg.setDb("testdb");
		cfg.setSchema("PUBLIC");

		// Output options
		String outputDirName = "../target/schemaspy/";
		cfg.setOutputDir(outputDirName);
		cfg.setHtmlGenerationEnabled(true);
		cfg.setAdsEnabled(false);

		//Run
		new SchemaAnalyzer().analyze(cfg);

		// Show generated web page
		String absolutePath = new File(outputDirName + "index.html").getAbsolutePath();
		if (Desktop.isDesktopSupported() && Desktop.getDesktop().isSupported(Action.BROWSE))
			Desktop.getDesktop().browse(new URI("file://" + absolutePath));
		else
			log.info(absolutePath);
	}
}
