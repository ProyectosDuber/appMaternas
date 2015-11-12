/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Ejecucion;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Hibernate Utility class with a convenient method to get Session Factory
 * object.
 *
 * @author Duber
 */
public class HibernateUtil {

    private static final SessionFactory sessionFactory;
    public static  Session sesion;
    static {
        try {
            // Create the SessionFactory from standard (hibernate.cfg.xml) 
            // config file.
            sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // Log the exception. 
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    
    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    //mio
    public static List Query(String query){
        
        try {
            Query q = sesion.createQuery(query);
           return q.list();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    public static List QuerySQL(String query){
        
        try {
            Query q = sesion.createSQLQuery(query);
           return q.list();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    public static Object QueryUnicode(String query){
        
        try {
            Query q = sesion.createQuery(query);
           return q.uniqueResult();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
     public static Object QueryUnicodeSQL(String query){
        
        try {
            Query q = sesion.createSQLQuery(query);
           return q.uniqueResult();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }
    public static void save(Object objeto){
        
        try {
            Transaction tr = sesion.getTransaction();
            tr.begin();
            sesion.save(objeto);
            tr.commit();
           
        } catch (Exception e) {
            System.out.println(e.getMessage());
         
        }
    }
    public static void update(Object objeto){
        
        try {
            Transaction tr = sesion.getTransaction();
            tr.begin();
            sesion.update(objeto);
            tr.commit();
           
        } catch (Exception e) {
            System.out.println(e.getMessage());
         
        }
    }
    public static void delete(Object objeto){
        
        try {
            Transaction tr = sesion.getTransaction();
            tr.begin();
            sesion.delete(objeto);
            tr.commit();
           
        } catch (Exception e) {
            System.out.println(e.getMessage());
         
        }
    }
    
}
