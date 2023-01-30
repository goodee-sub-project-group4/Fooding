package com.fd.search.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

public class SearchDao {
	
	private Properties prop = new Properties(); 
	
	public SearchDao() {
		
		try {
			prop.loadFromXML(new FileInputStream( SearchDao.class.getResource("db/sql/search-mapper.xml").getPath() ));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

}
