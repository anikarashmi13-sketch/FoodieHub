package com.tap.model;

import java.util.Collection;
import java.util.HashMap;

public class Cart {

    private HashMap<Integer, CartItem> items =
            new HashMap<>();

    public void addItem(CartItem item) {

        int menuId = item.getMenuId();

        if(items.containsKey(menuId)) {

            CartItem existingItem = items.get(menuId);

            existingItem.setQuantity(
                    existingItem.getQuantity() + item.getQuantity());
        }
        else {

            items.put(menuId, item);
        }
    }

    public void updateQuantity(int menuId, int quantity) {

        if(items.containsKey(menuId)) {

            CartItem item = items.get(menuId);

            item.setQuantity(quantity);

            if(quantity <= 0) {

                items.remove(menuId);
            }
        }
    }

    public void removeItem(int menuId) {

        items.remove(menuId);
    }

    public Collection<CartItem> getItems() {

        return items.values();
    }

    public double getGrandTotal() {

        double total = 0;

        for(CartItem item : items.values()) {

            total += item.getPrice() * item.getQuantity();
        }

        return total;
    }
}