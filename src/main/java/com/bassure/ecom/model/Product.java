package com.bassure.ecom.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString()
public class Product {

    private int id;
    private String name;
    private String category;
    private Double price;
    private String image;

    public Product() {
    }

}
