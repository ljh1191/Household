package org.zerock.household;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.HouseholdVO;
import org.zerock.service.MainService;

@Controller
@RequestMapping("/table/*")
public class TableController {
	private static final Logger logger = LoggerFactory.getLogger(TableController.class);
	
	@Inject
	private MainService service;
	
	@GetMapping("/tableform")
	public String tableForm(String membernum,Model mo) {
		List<HouseholdVO> list = service.tableList(Integer.parseInt(membernum));
		mo.addAttribute("list", list);
		logger.info("���̺��� �̵�");
		return "/table/list";
	}
}