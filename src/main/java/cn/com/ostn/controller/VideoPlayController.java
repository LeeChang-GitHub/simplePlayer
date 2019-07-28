package cn.com.ostn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class VideoPlayController {

    private final HttpServletRequest request;

    @Autowired
    public VideoPlayController(HttpServletRequest request) {
        this.request = request;
    }

    /**
     * 获取服务器端的webapps路径
     * @return .
     */
    private String findServerPath(){
        return new File(request.getSession().getServletContext().getRealPath("")).getParent();
    }


    /**
     * 显示所有剧情
     * @return .
     */
    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView();
        List<Map<String, Object>> map = findDirectory(findServerPath()+"/play/");
        mv.addObject("list",map);
        mv.setViewName("/list");
        return mv;
    }

    /**
     * 显示剧情剧集列表
     * @param path .
     * @return .
     */
    @RequestMapping("/jojo")
    public ModelAndView jojo(String path) {
        ModelAndView mv = new ModelAndView();
        path = findServerPath()+"/play/"+path;
        System.out.println(path);
        List<Map<String, Object>> map = findFiles(path);
        mv.addObject("videos",map);
        mv.setViewName("/details");
        return mv;
    }

    /**
     * 如果是文本就展示文本 否则按照视频展示
     * @param path .
     * @return .
     */
    @RequestMapping("/play")
    public ModelAndView play(String path) {
        ModelAndView mv = new ModelAndView();
        if(path.contains(".txt")){
            mv.setViewName("show");
            mv.addObject("path",path);
            return mv;
        }else{
            mv.addObject("videoPath",path);
            mv.setViewName("/play");
            return mv;
        }
    }

    private static List<Map<String, Object>> findDirectory(String path) {
        List<Map<String, Object>> folders = new ArrayList<>();
        File file = new File(path);
        File[] tempList = file.listFiles();
        assert tempList != null;
        for (File aTempList : tempList) {
            if (aTempList.isDirectory()) {
                Map<String, Object> foldersMap = new HashMap<>();
                foldersMap.put("path", aTempList.toString().replaceAll("\\\\", "/"));
                foldersMap.put("name", aTempList.getName().replaceAll("\\\\", "/"));
                folders.add(foldersMap);
            }
        }
        return folders;
    }

    private static List<Map<String, Object>> findFiles(String path) {
        List<Map<String, Object>> folders = new ArrayList<>();

        File file = new File(path);
        File[] tempList = file.listFiles();
        assert tempList != null;
        for (File aTempList : tempList) {
            if (aTempList.isFile()) {
                Map<String, Object> foldersMap = new HashMap<>();
                String url = aTempList.toString().replaceAll("\\\\", "/");
                int index = path.indexOf("play/");
                foldersMap.put("videoUrl", url.substring(index));
                foldersMap.put("videoName", aTempList.getName().replaceAll("\\\\", "/"));
                folders.add(foldersMap);
            }
        }
        return folders;

    }


}
