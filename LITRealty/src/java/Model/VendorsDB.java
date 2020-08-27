/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entities.Vendors;
import javax.persistence.EntityManager;

/**
 *
 * @author John
 */
public class VendorsDB {
    public static Vendors getVendorById(Integer vendorId) {
        EntityManager em = DBUtil.getEmf().createEntityManager();

        return em.find(Vendors.class, vendorId);
    }
}
