<%-- 
    Document   : cart page
    Created on : 14-jul-2014, 14:12:06
    Author     : Alexander Antipin
--%>


<div id="singleColumn">
    
<!----------------------------------------------------------------------------->
    <div id="actionBar">
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="viewCart?clear=true" class="bubble hMargin">clear cart</a>
        </c:if>

        <%-- continue shopping widget --%>
        <c:set var="value">
            <c:choose>
                <%-- if 'selectedCategory' session object exists, send user to previously viewed category --%>
                <c:when test="${!empty selectedCategory}">
                    category
                </c:when>
                <%-- otherwise send user to welcome page --%>
                <c:otherwise>
                    index.jsp
                </c:otherwise>
            </c:choose>
        </c:set>

        <a href="${value}" class="bubble hMargin">continue shopping</a>

        <%-- checkout widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="checkout" class="bubble hMargin">proceed to checkout &#x279f;</a>
        </c:if>
    </div>
<!----------------------------------------------------------------------------->
    <div>
        <c:choose>
            <c:when test="${cart.numberOfItems > 1}">
                <p>Your shopping cart contains ${cart.numberOfItems} items.</p>
            </c:when>
            <c:when test="${cart.numberOfItems == 1}">
                <p>Your shopping cart contains ${cart.numberOfItems} item.</p>
            </c:when>
            <c:otherwise>
                <p>Your shopping cart is empty.</p>
            </c:otherwise>
        </c:choose>
        
        <h4 id="subtotal">subtotal: &euro; ${cart.subtotal}</h4>
    </div>    
<!----------------------------------------------------------------------------->
    <c:if test="${!empty cart && cart.numberOfItems != 0}">
        
        <table id="cartTable">

            <tr class="header">
                <th>product</th>
                <th>name</th>
                <th>price</th>
                <th>quantity</th>
            </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

            <c:set var="product" value="${cartItem.product}"/>

                <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                    <td>
                        <img src="${initParam.productImagePath}${product.name}.png"
                             alt="${product.name}">
                    </td>

                    <td>${product.name}</td>

                    <td>
                        &euro; ${cartItem.total}
                        <br>
                        <span class="smallText">( &euro; ${product.price} / unit )</span>
                    </td>
                  
                    <td>
                        <form action="updateCart" method="post">
                            <input type="hidden"
                                   name="productId"
                                   value="${product.id}">
                            <input type="text"
                                   maxlength="2"
                                   size="2"
                                   value="${cartItem.quantity}"
                                   name="quantity"
                                   style="margin:5px">
                            <input type="submit"
                                   name="submit"
                                   value="update">
                        </form>
                    </td>
            </tr>

        </c:forEach>

      </table>

    </c:if>
</div>
    