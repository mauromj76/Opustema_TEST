package it.logicadeisistemi.opustema.app.config;

import it.logicadeisistemi.opustema.security.SecurityConfig;
import javax.servlet.Filter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ECompetenceWebMvcInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{AppConfig.class, SecurityConfig.class, PersistenceConfig.class, WebMvcConfig.class};
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return null;
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }

    @Override
    protected Filter[] getServletFilters() {
        System.out.println("#### getServletFilters started");
        
//        UrlRewriteFilter urlRewriteFilter = new UrlRewriteFilter();
        /*
         * Add filter configuration here if necessary
         */
        System.out.println("#### getServletFilters terminated");
//        return new Filter[]{urlRewriteFilter};
        return super.getServletFilters();
    }
}
