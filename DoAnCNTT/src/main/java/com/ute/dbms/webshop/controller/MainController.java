package com.ute.dbms.webshop.controller;

import com.ute.dbms.webshop.entity.Product;
import com.ute.dbms.webshop.entity.Role;
import com.ute.dbms.webshop.entity.User;
import com.ute.dbms.webshop.model.UserForm;
import com.ute.dbms.webshop.entity.UserInfo;
import com.ute.dbms.webshop.repository.ProductRepository;
import com.ute.dbms.webshop.repository.RoleRepository;
import com.ute.dbms.webshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    private UserRepository  userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @GetMapping(value = "/")
    public String home1(Model model) {
        model.addAttribute("products", productRepository.findAll()); //phương thức findAll trả về một đối tượng Trang
        return "index";
    }

    @GetMapping("/contact")
    public String contact() {
        return "lienhe";
    }
    @GetMapping("/blog")
    public String blog() {
        return "blog";
    }
    @GetMapping("/gioithieu")
    public String gioithieu() {
        return "gioithieu";
    }


    @GetMapping("/login")
    public String login() {
        return "sign-in";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth); //đăng xuất cũng yêu cầu xóa một số hoặc tất cả cookie của người dùng.
        }                                                                       //tạo LogoutHandler của riêng mình để lặp lại tất cả các cookie và hết hạn chúng khi đăng xuất:
        return "redirect:/index";
    }
    @GetMapping(value = "/signup")
    public String  signup(Model model){
        model.addAttribute("userForm", new UserForm()); //trong đối tượng Model có phương thức addAttribute()
        return "sign-up";                                            // được sử dụng để thêm dữ liệu vào model
    }
    @PostMapping("/register")
    public String register(@Valid UserForm userForm){
        System.out.println(userForm.getEmail());
        if(userRepository.findByEmail(userForm.getEmail()) == null){
            User oth = new User();
            oth.setEmail(userForm.getEmail());
            oth.setPassword(passwordEncoder.encode(userForm.getPassword()));
            userRepository.save(oth);
            UserInfo userInfo = new UserInfo(userForm.getUserName(), userForm.getPhone(), userForm.getAddress());
            oth.setUserInfo(userInfo);
            userInfo.setUser(oth);
            HashSet<Role> roles = new HashSet<>();
            roles.add(roleRepository.findByRoleName("ROLE_MEMBER"));
            oth.setRoles(roles);
            userRepository.save(oth);
            return "redirect:/";
        }
        return "redirect:/signup?error";
    }
}