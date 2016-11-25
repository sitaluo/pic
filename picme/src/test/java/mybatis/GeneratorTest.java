package mybatis;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;

public class GeneratorTest {

	public static void main(String[] args) throws IOException,
			XMLParserException, InvalidConfigurationException, SQLException,
			InterruptedException {
		
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
		ConfigurationParser cp = new ConfigurationParser(warnings);
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);

		ResourcePatternResolver resovler = new PathMatchingResourcePatternResolver();
		Resource resources[] = resovler.getResources("classpath:mybatis/generatorConfig-*.xml");
		//Resource resources[] = resovler.getResources("classpath:mybatis/generatorConfig-msg.xml");

		for (Resource resource : resources) {
			File configFile = resource.getFile();
			Configuration config = cp.parseConfiguration(configFile);
			MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
					callback, warnings);
			myBatisGenerator.generate(null);
			System.out.println(configFile.getName()+"文件生成");
		}

	}

}
