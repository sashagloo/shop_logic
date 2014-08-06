package session;

import entity.OrderedProduct;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * OrderedProductFacade class (Session Bean)
 * @see AbstractFacade
 * @author Alexander Antipin
 * @version 25-jul-2014
 */
@Stateless
public class OrderedProductFacade extends AbstractFacade<OrderedProduct> {
    @PersistenceContext(unitName = "AffableBeanPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderedProductFacade() {
        super(OrderedProduct.class);
    }

}
