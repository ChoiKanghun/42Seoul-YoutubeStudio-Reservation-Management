package kr.or.connect.ftYoutube.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan(basePackages =  {"kr.or.connect.ftYoutube.dao", "kr.or.connect.ftYoutube.service" })
@Import(DBConfig.class)
public class ApplicationConfig {

}
