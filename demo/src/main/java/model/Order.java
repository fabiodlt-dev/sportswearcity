package model;

import java.time.LocalDate;
import java.util.Date;

public class Order {
    private int orderId;
    private int customerId;
    private int cartId;
    private String shipping_fullName;
    private String shipping_address;
    private String shipping_city;
    private String shipping_state;
    private String shipping_zip;
    private String shipping_country;

    private Date orderDate;
    private String payment_method;
    private float payment_amount;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getShipping_fullName() {
        return shipping_fullName;
    }

    public void setShipping_fullName(String shipping_fullName) {
        this.shipping_fullName = shipping_fullName;
    }

    public String getShipping_address() {
        return shipping_address;
    }



    public void setShipping_address(String shipping_address) {
        this.shipping_address = shipping_address;
    }

    public String getShipping_city() {
        return shipping_city;
    }

    public void setShipping_city(String shipping_city) {
        this.shipping_city = shipping_city;
    }

    public String getShipping_state() {
        return shipping_state;
    }

    public void setShipping_state(String shipping_state) {
        this.shipping_state = shipping_state;
    }

    public String getShipping_zip() {
        return shipping_zip;
    }

    public void setShipping_zip(String shipping_zip) {
        this.shipping_zip = shipping_zip;
    }

    public String getShipping_country() {
        return shipping_country;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public void setShipping_country(String shipping_country) {
        this.shipping_country = shipping_country;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public float getPayment_amount() {
        return payment_amount;
    }

    public void setPayment_amount(float payment_amount) {
        this.payment_amount = payment_amount;
    }
}
