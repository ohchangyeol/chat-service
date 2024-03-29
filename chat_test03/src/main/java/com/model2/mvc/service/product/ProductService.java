package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;


//==> 회원관리에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface ProductService {
	
	// 상품 등록
	public void addProduct(Product prodcut) throws Exception;
	
	// 상품 정보 보기
	public Product getProduct(int prodNo) throws Exception;
	
	// 최근 상품 조회
	public int getProdNo () throws Exception ;
	
	// 상품 정보 리스트 
	public Map<String , Object> getProductList(Search search) throws Exception;
	
	// 상품 정보 수정
	public void updateProduct(Product product) throws Exception;
	
	// 상품 이름 중복 확인
	public boolean checkDuplication(int prodNo) throws Exception;
	
}