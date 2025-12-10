package ma.projet.api.service;

import java.util.List;

import org.springframework.stereotype.Service;

import ma.projet.api.model.Product;
import ma.projet.api.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository repository;

    public ProductService(ProductRepository repository) {
        this.repository = repository;
    }

    public List<Product> getAllProducts() {
        return repository.findAll();
    }

    public Product getProductById(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new RuntimeException("Produit non trouvé"));
    }
}





