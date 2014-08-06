package session;

import entity.CustomerOrder;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * CustomerOrderFacade class (Session Bean)
 * @see AbstractFacade
 * @author Alexander Antipin
 * @version 25-jul-2014
 */
@Stateless
public class CustomerOrderFacade extends AbstractFacade<CustomerOrder> {
    @PersistenceContext(unitName = "AffableBeanPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CustomerOrderFacade() {
        super(CustomerOrder.class);
    }

}
