package com.ute.dbms.webshop.controller;

import com.ute.dbms.webshop.entity.Product;
import com.ute.dbms.webshop.repository.ProductRepository;
import com.ute.dbms.webshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ProductRepository productRepository;


    @GetMapping(value = "/{id}")
    public String product(@PathVariable("id") int id, Model model){     // thực hiển truy vấn đến /product/{id} với
                                                                        // id được truyền vào thì getEmployeeById() sẽ được gọi với giá trị id tương ứng.
        Product product = productRepository.findById(id);
        product.setQuantily(1);
        if(product == null){
            System.out.println("\n\n null \n\n");
        }
        model.addAttribute("product", product); //được sử dụng để thêm dữ liệu vào model.
        return "product";
    }
}