package it.logicadeisistemi.opustema.app.config;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;
import javax.sql.DataSource;
import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.instrument.classloading.InstrumentationLoadTimeWeaver;
import org.springframework.instrument.classloading.LoadTimeWeaver;
import org.springframework.orm.jpa.JpaDialect;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaDialect;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@PropertySource({"classpath:database.properties","classpath:hibernate.properties"})
@ComponentScan({"it.logicadeisistemi.opustema.model"})
public class PersistenceConfig {

    protected static final Logger logger = Logger.getLogger(PersistenceConfig.class);

    @Autowired
    private ConfigurableEnvironment env;

    //////////////////// JPA //////////////////////////////////
    @Bean(name = "dataSource")
    public DataSource getDataSource() {
        logger.info("######### Entered getDataSource");
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/opus?createDatabaseIfNotExist=true");
        dataSource.setUsername("accademia");
        dataSource.setPassword("K4lt4niss3tta");
        logger.info("######### Finished getDataSource");

        return dataSource;
    }

//    @Autowired
//    @Bean(name = "sessionFactory")
//    public SessionFactory getSessionFactory(DataSource dataSource) {
//        logger.info("######### Entered getSessionFactory");
//        LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
//        sessionBuilder.scanPackages("it.logicadeisistemi.bol.hbol.model");
//        logger.info("######### Finished getSessionFactory");
//        return sessionBuilder.buildSessionFactory();
//    }
//    @Autowired
//    @Bean(name = "transactionManager")
//    public HibernateTransactionManager getTransactionManager(
//            SessionFactory sessionFactory) {
//        logger.info("######### Entered getTransactionManager");
//        HibernateTransactionManager transactionManager = new HibernateTransactionManager(
//                sessionFactory);
//
//        logger.info("######### Finished getTransactionManager");
//        return transactionManager;
//    }
    @Bean
    public JpaTransactionManager jpaTransMan() {
        logger.info("######### Entered jpaTransMan");
        JpaTransactionManager jtManager = new JpaTransactionManager(
                getEntityManagerFactoryBean().getObject());
        logger.info("######### Finished jpaTransMan");
        return jtManager;
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean getEntityManagerFactoryBean() {
        logger.info("######### Entered getEntityManagerFactoryBean");
        LocalContainerEntityManagerFactoryBean lcemfb = new LocalContainerEntityManagerFactoryBean();
        lcemfb.setDataSource(getDataSource());
        lcemfb.setPersistenceUnitName("localEntity");
        lcemfb.setJpaProperties(jpaProperties());
        lcemfb.setJpaVendorAdapter(jpaVendorAdapter());
        lcemfb.setJpaDialect(jpaDialect());
        lcemfb.setPackagesToScan("it.logicadeisistemi.opustema.model");//bol
        LoadTimeWeaver loadTimeWeaver = new InstrumentationLoadTimeWeaver();
        lcemfb.setLoadTimeWeaver(loadTimeWeaver);
        logger.info("######### Finished getEntityManagerFactoryBean");
        return lcemfb;
    }

    @Bean(name = "jpaVendorAdapter")
    public JpaVendorAdapter jpaVendorAdapter() {
        // FIXME: set all needed properties here
        HibernateJpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        vendorAdapter.setDatabase(Database.MYSQL);
        vendorAdapter.setGenerateDdl(true);
        vendorAdapter.setShowSql(true);
//        vendorAdapter.setPrepareConnection(true);
        return vendorAdapter;
    }

    @Bean(name = "jpaDialect")
    public JpaDialect jpaDialect() {
        return new HibernateJpaDialect();
    }

    public Properties jpaProperties() {
        logger.info("######### Entered jpaProperties");
//        String[] props = {"hibernate.dialect", "hibernate.show_sql", "hibernate.format_sql",
//            "hibernate.hbm2ddl.auto", "hibernate.validationQuery", "hibernate.validationInterval",
//            "hibernate.testOnBorrow", "hibernate.removeAbandoned", "hibernate.removeAbandonedTimeout",
//            "hibernate.connection.charSet", "hibernate.connection.characterEncoding", "hibernate.connection.useUnicode",
//            "hibernate.dbcp.maxActive", "hibernate.dbcp.whenExhaustedAction", "hibernate.dbcp.maxWait",
//            "hibernate.dbcp.maxIdle", "hibernate.dbcp.ps.maxActive", "hibernate.dbcp.ps.whenExhaustedAction",
//            "hibernate.dbcp.ps.maxWait", "hibernate.dbcp.ps.maxIdle", "hibernate.dbcp.validationQuery",
//            "hibernate.dbcp.testOnBorrow", "hibernate.dbcp.testOnReturn", "hibernate.dbcp.testWhileIdle",
//            "hibernate.generate_statistics"};
        Properties properties = new Properties();
        try {
            Properties px = PropertiesLoaderUtils.loadAllProperties("hibernate.properties");
            Enumeration enu = px.propertyNames();
            while (enu.hasMoreElements()) {
                String s = (String) enu.nextElement();
                String ps = env.getProperty(s);
                properties.setProperty(s, ps);
                logger.info("Properties configured: " + s + " = " + ps);
            }

        } catch (IOException ex) {
            // FIXME
            ex.printStackTrace();
        }

//        properties.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
//        properties.setProperty("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
//        properties.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
//        properties.setProperty("hibernate.format_sql", env.getProperty("hibernate.format_sql"));
//        properties.setProperty("hibernate.connection.charSet", env.getProperty("hibernate.connection.charSet"));
//        properties.setProperty("hibernate.validationQuery", env.getProperty("hibernate.validationQuery"));
//        properties.setProperty("hibernate.validationInterval", env.getProperty("hibernate.validationInterval"));
//        properties.setProperty("hibernate.testOnBorrow", env.getProperty("hibernate.testOnBorrow"));
//        properties.setProperty("hibernate.removeAbandoned", env.getProperty("hibernate.removeAbandoned"));
//        properties.setProperty("hibernate.removeAbandonedTimeout", env.getProperty("hibernate.removeAbandonedTimeout"));
//        properties.setProperty("hibernate.connection.charSet", env.getProperty("hibernate.connection.charSet"));
//        properties.setProperty("hibernate.cache.use_second_level_cache", env.getProperty("hibernate.cache.use_second_level_cache"));
//        properties.setProperty("hibernate.cache.use_query_cache", env.getProperty("hibernate.cache.use_query_cache"));
//        properties.setProperty("hibernate.cache.use_structured_entries", env.getProperty("hibernate.cache.use_structured_entries"));
//        properties.setProperty("hibernate.generate_statistics", env.getProperty("hibernate.generate_statistics"));
        logger.info("######### Exiting jpaProperties");
        return properties;
    }

    //////////////////// HIBERNATE //////////////////////////////////
//    @Bean
//    public LocalSessionFactoryBean sessionFactory() {
//        logger.info("######### Entered sessionFactory");
//        LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
//        sessionFactory.setDataSource(restDataSource());
//        sessionFactory.setPackagesToScan(new String[]{"it.logicadeisistemi.bol"});
//        sessionFactory.setHibernateProperties(hibernateProperties());
//
//        logger.info("######### Finished sessionFactory");
//        return sessionFactory;
//    }
    @Bean
    public DataSource restDataSource() {
        logger.info("######### Entered restDataSource");
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
        dataSource.setUrl(env.getProperty("jdbc.url"));
        dataSource.setUsername(env.getProperty("jdbc.username"));
        dataSource.setPassword(env.getProperty("jdbc.password"));

        logger.info("######### Finished restDataSource");
        return dataSource;
    }

//    @Bean
//    @Autowired
//    public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
//        logger.info("######### Entered transactionManager");
//        HibernateTransactionManager txManager = new HibernateTransactionManager();
//        txManager.setSessionFactory(sessionFactory);
//
//        logger.info("######### Finished transactionManager");
//        return txManager;
//    }
    @Bean
    public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
        logger.info("######### Entered exceptionTranslation");
        logger.info("######### Finished exceptionTranslation");
        return new PersistenceExceptionTranslationPostProcessor();
    }

    Properties hibernateProperties() {
        logger.info("######### Entered hibernateProperties");
        logger.info("######### Finished hibernateProperties");
        return new Properties() {
            {
                setProperty("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
                setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
                setProperty("hibernate.globally_quoted_identifiers", "true");
            }
        };
    }
}
