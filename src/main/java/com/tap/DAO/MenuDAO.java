package com.tap.DAO;

import java.util.List;
import com.tap.model.Menu;

public interface MenuDAO {

    Menu getMenuById(int menuId);

    List<Menu> getMenuByRestaurantId(int restaurantId);

    List<Menu> searchMenuItems(int restaurantId, String keyword);
    
    List<Menu> getAllMenus();
    boolean addMenu(Menu menu);
    boolean updateMenu(Menu menu);
    boolean deleteMenu(int menuId);
}