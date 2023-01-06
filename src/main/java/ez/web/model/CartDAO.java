package ez.web.model;

import java.util.ArrayList;

public class CartDAO {
	// 장바구니
	private ArrayList<ProductDTO> cartList;
	
	public CartDAO() {
		cartList = new ArrayList<ProductDTO>();
	}
	

	public void addProduct(ProductDAO pDao, String pNum, String pQty, String pSpec) {

		
		// 상품 수량
		int addQty = Integer.parseInt(pQty.trim());
		
		for(ProductDTO pDto : cartList) {
 
			if(pNum.equals(String.valueOf(pDto.getpNum()))){
				pDto.setpQty(pDto.getpQty()+addQty);
				return;
			}
		}
		
		
		ProductDTO pDto = pDao.getProduct(pNum, pSpec);
		System.out.println("상품 가져오기 완료!!");
		
		if(pDto !=null) {
			System.out.println("##############");
			pDto.setpQty(addQty);
			cartList.add(pDto);
		}
	}
	
	// 장바구니안에 모든 상품을 가져오기
	public ArrayList<ProductDTO> getCartList(){
		return cartList;
	}
	
	// 장바구니 안에 상품 삭제하기
	public void deleteProduct(String pNum) {
		for(ProductDTO pDto : cartList) {
			if(pNum.equals(String.valueOf(pDto.getpNum()))) {
				cartList.remove(pDto);
				break;
			}
		}
	}
	
	
	// 장바구니 상품 수량 수정
	public void modifyProduct(String pNum, String pQty) {
		int qty = Integer.parseInt(pQty.trim());
		
		for(ProductDTO pDto : cartList) {
			if(pNum.equals(String.valueOf(pDto.getpNum()))) {
				if(qty<=0) {
					cartList.remove(pDto);
					break;
				}else {
					pDto.setpQty(qty);
					break;
				}
			}
		}
	}
	
	
	
}
