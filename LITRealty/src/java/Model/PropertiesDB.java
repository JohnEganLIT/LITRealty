/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entities.Properties;
import java.io.File;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;

/**
 *
 * @author John
 */
public class PropertiesDB {
        public static List<Properties> getAllProperties() {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        String q = "SELECT p FROM Properties p";
        TypedQuery<Properties> tq = em.createQuery(q, Properties.class);
        
        List<Properties> list;
            
            try {
            list = tq.getResultList();
                if(list == null || list.isEmpty()) {
                    list = null;
                }
            }finally {
                em.close();
            }
            return list;
    }
        
    public static List<Properties> getAllPropertiesForAgent(Integer agentId) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        String q = "SELECT p FROM Properties p where p.agentId = " + agentId;
        TypedQuery<Properties> tq = em.createQuery(q, Properties.class);
        
        List<Properties> list;
            
            try {
            list = tq.getResultList();
                if(list == null || list.isEmpty()) {
                    list = null;
                }
            }finally {
                em.close();
            }
            return list;
    }
        
    public static Properties getPropertyByID(Integer id) {
        EntityManager em = DBUtil.getEmf().createEntityManager();

        return em.find(Properties.class, id);
    }    
    
    public static void editProperty(Properties p) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.merge(p);
            trans.commit();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
         
            
    }
    
    public static void addProperty(Properties p) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.persist(p);
            trans.commit();
        } catch (Exception ex) {
            System.out.println(ex);
        }
         
            em.close();
    }
    
    public static void deleteProperty(Properties p) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.remove(em.merge(p));
            trans.commit();
        }
        catch(Exception ex) {
            System.out.println(ex);
        }
        finally {
            em.close();
        }
    }
    
    public static List<Properties> getRecentProperties(Date dateToLookBackAfter) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        String q = "SELECT p FROM Properties p where p.dateAdded > :dateToLookBackAfter";
        TypedQuery<Properties> tq = em.createQuery(q, Properties.class);
        tq.setParameter("dateToLookBackAfter", dateToLookBackAfter, TemporalType.DATE);
        List<Properties> list;
            
            try {
            list = tq.getResultList();
                if(list == null || list.isEmpty()) {
                    list = null;
                }
            }finally {
                em.close();
            }
            return list;
    }
    
    public static List<Properties> getAveragePriceByCity(String city) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        String q = "SELECT p FROM Properties p where p.city = :city OR p.street = :city";
        TypedQuery<Properties> tq = em.createQuery(q, Properties.class);
        tq.setParameter("city", city);
        List<Properties> list;
            
            try {
            list = tq.getResultList();
                if(list == null || list.isEmpty()) {
                    list = null;
                }
            }finally {
                em.close();
            }
        return list;
    }
    
    public static List<Properties> getPropertiesInRange(Double minValue, Double maxValue) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        String q = "SELECT p FROM Properties p where p.price >= :minValue AND p.price <= :maxValue";
        TypedQuery<Properties> tq = em.createQuery(q, Properties.class);
        tq.setParameter("minValue", minValue);
        tq.setParameter("maxValue", maxValue);
        
        List<Properties> list;
            
            try {
            list = tq.getResultList();
                if(list == null || list.isEmpty()) {
                    list = null;
                }
            }finally {
                em.close();
            }
        return list;
    }

}
