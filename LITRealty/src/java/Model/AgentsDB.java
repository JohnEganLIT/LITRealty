/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entities.Agents;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

/**
 *
 * @author John
 */
public class AgentsDB {
    public static List<Agents> getAllAgents() {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        String q = "Select a from Agents a";
        TypedQuery<Agents> tq = em.createQuery(q, Agents.class);
        List<Agents> list;
        
        try {
            list = tq.getResultList();
            if(list == null || list.isEmpty()) list = null;
        } finally {
            em.close();
        }
        return list;
    }
    
    public static Agents getAgentById(Integer id) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        String q = "SELECT a from Agents a where a.agentId = :id";
        TypedQuery<Agents> tq = em.createQuery(q, Agents.class);
        tq.setParameter("id", id);
        
        Agents a;
        try {
            a = tq.getSingleResult();
        } finally {
            em.close();
        }
        return a;
    }
    
    
    public static Agents getAgentByUsername(String username) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        String q = "SELECT a from Agents a where a.username = :username";
        TypedQuery<Agents> tq = em.createQuery(q, Agents.class);
        tq.setParameter("username", username);
        
        Agents a;
        try {
            a = tq.getSingleResult();
            if(a == null) {
                a = null;
            }
        }finally {
            em.close();
        }
        return a;
    }
    
    public static List<String> getAllPasswords() {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        String q = "SELECT a.password from Agents a";
        TypedQuery<String> tq = em.createQuery(q, String.class);
        List<String> list;
        
        try {
            list = tq.getResultList();
            if(list == null || list.isEmpty()) list = null;
            } finally {
                em.close();   
            }
        return list;
    }
    
    public static void updatePassword(Agents a) {
        EntityManager em = DBUtil.getEmf().createEntityManager();
        
        EntityTransaction trans = em.getTransaction();
        
        try {
            trans.begin();
            em.merge(a);
            trans.commit();
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            em.close();
        }
    }
}
