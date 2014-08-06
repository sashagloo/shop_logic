package session;

import entity.Product;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * ProductFacade class (Session Bean)
 * @see AbstractFacade
 * @author Alexander Antipin
 * @version 25-jul-2014
 */
@Stateless
public class ProductFacade extends AbstractFacade<Product> {
    
    @PersistenceContext(unitName = "AffableBeanPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProductFacade() {
        super(Product.class);
    }

}
