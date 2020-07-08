package com.kosmo.travelmaker.web.planner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.travelmaker.service.PlannerDTO;
import com.kosmo.travelmaker.service.SpotsDTO;
import com.kosmo.travelmaker.service.impl.CityServiceImpl;
import com.kosmo.travelmaker.service.impl.PlannerServiceImpl;
import com.kosmo.travelmaker.service.impl.SpotsServiceImpl;

@Controller
@RequestMapping("/TravelMaker/")
public class PlannerController {
	@Value("${GoogleMapApiKey}")
	private String GoogleMapApiKey;
	@Resource(name="spotsService")
	private SpotsServiceImpl spotsService;
	@Resource (name="cityService")
	private CityServiceImpl cityService;
	
	@Resource(name ="plannerService")
	private PlannerServiceImpl plannerService;
	

	@RequestMapping(value = "Planner.kosmo")
	public String Planner(@RequestParam Map map,Model model,HttpSession session) {
		
		int planner_no=0;
		System.out.println("map.get(\"planner_no\"):"+map.get("planner_no"));
		List<String> city_no_name=new Vector<String>();
		if(map.get("planner_no")==null) {
			String[] city_no_list=map.get("city_no").toString().split(",");
			if(plannerService.insertPlanner(session.getAttribute("id").toString())) {
				System.out.println("플래너가 저장되었습니다.");
				planner_no=plannerService.selectPlannerNo();
				System.out.println("planner_no:"+planner_no);
			};
			
			Map<String, Integer> maps=new HashMap<String, Integer>();
			maps.put("planner_no", planner_no);
			
			for(String city_no:city_no_list) {
				System.out.println("도시번호:"+city_no);
				maps.put("city_no",Integer.parseInt(city_no.trim()));
				
				if(plannerService.insertCities(maps)) {
					System.out.println(city_no+" 도시가 저장되었습니다.");
				};
			}
			
			for(String no:city_no_list) {
				city_no_name.add(cityService.selectCityDTO(Integer.parseInt(no)).getCity_name());
				
			}
		}
		else {
			String numbers="";
			for(int no:plannerService.selectPlannerList(Integer.parseInt(map.get("planner_no").toString()))) {
				numbers+=no+",";
				city_no_name.add(cityService.selectCityDTO(no).getCity_name());
				
			}
			System.out.println("numbers:"+numbers);
			String city_no=numbers.substring(0, numbers.length()-1);
			
			model.addAttribute("city_no",city_no);
			
		}
		
		model.addAttribute("planner_no",planner_no);
		model.addAttribute("city_no_name",city_no_name);
		//String user_id=session.getAttribute("id").toString();
		//cityService.makingplanner(user_id);
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("returnFromMap",false);
		return "planner/Planner";
	}
	
	
	@RequestMapping("Plan.kosmo")
	public String Plan(@RequestParam Map map, Model model) {

		System.out.println("city_name:"+map.get("origin"));
		int city_no=cityService.selectCityNo(map);
		Map<String,List<String>> dayPlan =new HashMap<String,List<String>>();
		for(int i=1;i<=5;i++) {
			List<String> spotIDs=new Vector<String>();
			dayPlan.put("day"+i, spotIDs);
		}
		//model.addAttribute("planner_no",planner_no);
		model.addAttribute("planner_no",map.get("planner_no"));
		model.addAttribute("GoogleMapApiKey",GoogleMapApiKey);
		model.addAttribute("dayPlan",dayPlan);
		model.addAttribute("origin",map);
		model.addAttribute("city_no",city_no);
		return "planner/Plan.tiles";
		
	}
	
	@RequestMapping(value ="PlanSave.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public void PlanSave(@RequestParam Map map) {
		System.out.println("map"+map);
		System.out.println("city: "+map.get("city"));
		System.out.println("day1: "+map.get("day1[]"));
		System.out.println("day2: "+map.get("day2[]"));
		System.out.println("day3: "+map.get("day3[]"));
		System.out.println("day4: "+map.get("day4[]"));
		System.out.println("day5: "+map.get("day5[]"));
		
		
	}
	
	
	@RequestMapping("CitySearch.kosmo")
	public String CitySearch() {
		return "planner/CitySearch.main";
	}
	@RequestMapping("DayPlanSava.kosmo")
	public String DayPlanSava() {
		return "planner/Plan.tiles";
	}
	
	@RequestMapping(value ="SpotList.kosmo",produces ="text/html; charset=UTF-8")
	@ResponseBody
	public String SpotList(@RequestParam Map map) {
			System.out.println("city_no:"+map.get("city_no"));
			List<SpotsDTO> list=spotsService.spotList(map);
			Map<String,List<String>> dayPlan =new HashMap<String,List<String>>();
			for(int i=1;i<=5;i++) {
				List<String> spotIDs=new Vector<String>();
				dayPlan.put("day"+i, spotIDs);
			}
	
			
			for(SpotsDTO dto:list) {
				
				System.out.println("장소명:"+dto.getSpot_name()+",일차:"+dto.getAuto_plan_date());
				String day=dto.getAuto_plan_date();
				switch(day) {
					case "1":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "2":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "3":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					case "4":
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
						break;
					default:
						dayPlan.get("day"+day).add(dto.getSpot_id().toString());
				}
			}
			List<Map> collections = new Vector<Map>();
			collections.add(dayPlan);
			return JSONArray.toJSONString(collections);
		}
	
	@RequestMapping("SpotView.kosmo")
	public String SpotView() {
		return "planner/SpotView.tiles";
	}
	
	
}
