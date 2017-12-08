package com.model2.mvc.web.product;

import java.io.File;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;


//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	//setter Method ���� ����
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@RequestMapping(value="addProduct", method=RequestMethod.POST )
	public String addProduct( @ModelAttribute("product") Product product, @RequestParam("multi") MultipartFile multi, HttpServletRequest request, Model model ) throws Exception {

		System.out.println("/product/addProduct : POST");
		//Business Logic
		
	/*	if(FileUpload.isMultipartContent(request)) {
			String temDir = "C:\\Users\\bitcamp\\git\\08PJT\\08.Model2MVCShop(Rest Server)\\WebContent\\images\\uploadFiles\\";
		
		DiskFileUpload fileUpload = new DiskFileUpload();
		fileUpload.setRepositoryPath(temDir);
		fileUpload.setSizeMax(1024*1024*10);
		fileUpload.setSizeThreshold(1024*100);
		
		if(request.getContentLength()<fileUpload.getSizeMax()) {
			//Product product = new Product();
			StringTokenizer token = null;
			
			List filetemList = fileUpload.parseRequest(request);
			int Size = filetemList.size();
			for(int i = 0; i<Size; i++) {
				FileItem fileItem = (FileItem)filetemList.get(i);
				if(fileItem.isFormField()) {
					if(fileItem.getFieldName().equals("manuDate")) {
						token = new StringTokenizer(fileItem.getString("euc-kr"),"-");
						String manuDate = token.nextToken()+token.nextToken()+token.nextToken();
						product.setManuDate(manuDate);
						}
					else if(fileItem.getFieldName().equals("prodName"))
						product.setProdName(fileItem.getString("euc-kr"));
					else if(fileItem.getFieldName().equals("prodDetail"))
						product.setProdDetail(fileItem.getString("euc-kr"));
					else if(fileItem.getFieldName().equals("price"))
						product.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
					}else {
						if(fileItem.getSize()>0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							if(idx == -1) {
								idx = fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx+1);
							product.setFileName(fileName);
							try {
								File uploaded = new File(temDir, fileName);
								fileItem.write(uploaded);
							}catch (IOException e) {
								System.out.println(e);
							}
						}else {
							product.setFileName("../../images/empty.GIF");
						}
					}
				}
			productService.addProduct(product);
			model.addAttribute("productVO", product);
			}else {
				int overSize = (request.getContentLength()/1000000);
				System.out.println("<script>alert('������ ũ��� 1MB���� �Դϴ�. �ø��� ���� �뷮��"+overSize+"MB�Դϴ�.');");
				System.out.println("history.back();</script>");
			}
		}else {
			System.out.println("���ڵ�Ÿ���� mulpart/form-data�� �ƴմϴ�.");
			}*/
		
		
		File f = new File("C:\\Users\\bitcamp\\git\\10PJT\\10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles\\"+multi.getOriginalFilename());
		multi.transferTo(f);

		product.setFileName(multi.getOriginalFilename());
		productService.addProduct(product);
		model.addAttribute("productVO", product);

		return "forward:/product/addProduct.jsp";
	}
	
	@RequestMapping(value="getProduct")
	public String getProduct( @RequestParam("prodNo") String prodNo , @RequestParam("menu") String menu, Model model, HttpServletRequest request, HttpServletResponse response ) throws Exception {
		
		System.out.println("/product/getProduct : GET / POST");
		//Business Logic
		Product product = productService.getProduct(Integer.parseInt(prodNo));
		// Model �� View ����
		model.addAttribute("productVO", product);
		
		String str = "";
		Cookie[] cookies = request.getCookies();
		//System.out.println(cookies.length);
		
		if (cookies!=null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				//System.out.println(cookie.getName());
				if (cookie.getName().equals("history")) {
					str = cookie.getValue();
					//System.out.println(i);
				}
			}
		}
		str += prodNo+",";
		
		Cookie cookie = new Cookie("history", str);
		
		response.addCookie(cookie);
		
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.GET)
	public String updateProduct( @RequestParam("prodNo") String prodNo , Model model ) throws Exception{

		System.out.println("/product/updateProduct : GET");
		//Business Logic
		Product productVO = productService.getProduct(Integer.parseInt(prodNo));
		
		Purchase purchaseVO = purchaseService.getPurchase2(Integer.parseInt(prodNo));
		// Model �� View ����
		model.addAttribute("productVO", productVO);
		model.addAttribute("purchaseVO", purchaseVO);
		
		return "forward:/product/updateProductView.jsp";
	}
	
	@RequestMapping(value="updateProduct", method=RequestMethod.POST)
	public String updateProduct( @ModelAttribute("product") Product product, @RequestParam("multi") MultipartFile multi, Model model ) throws Exception{

		System.out.println("/product/updateProduct : POST");
		
		File f = new File("C:\\Users\\bitcamp\\git\\10PJT\\10.Model2MVCShop(Ajax)\\WebContent\\images\\uploadFiles\\"+multi.getOriginalFilename());
		multi.transferTo(f);

		product.setFileName(multi.getOriginalFilename());
		productService.updateProduct(product);
		
		model.addAttribute("productVO", product);

		return "forward:/product/getProduct?menu=manage";
	}
	
	@RequestMapping(value="listProduct")
	public String listProduct( @ModelAttribute("search") Search search, Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/product/listProduct : GET / POST");
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp";
	}
}