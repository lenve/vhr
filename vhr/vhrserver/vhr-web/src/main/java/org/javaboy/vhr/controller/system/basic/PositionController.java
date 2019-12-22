package org.javaboy.vhr.controller.system.basic;

import org.javaboy.vhr.model.Position;
import org.javaboy.vhr.model.RespBean;
import org.javaboy.vhr.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @作者 江南一点雨
 * @公众号 江南一点雨
 * @微信号 a_java_boy
 * @GitHub https://github.com/lenve
 * @博客 http://wangsong.blog.csdn.net
 * @网站 http://www.javaboy.org
 * @时间 2019-10-01 15:52
 */
@RestController
@RequestMapping("/system/basic/pos")
public class PositionController {
    @Autowired
    PositionService positionService;
    @GetMapping("/")
    public List<Position> getAllPositions() {
        return positionService.getAllPositions();
    }

    @PostMapping("/")
    public RespBean addPosition(@RequestBody Position position) {
        if (positionService.addPosition(position) == 1) {
            return RespBean.ok("添加成功!");
        }
        return RespBean.error("添加失败!");
    }

    @PutMapping("/")
    public RespBean updatePositions(@RequestBody Position position) {
        if (positionService.updatePositions(position) == 1) {
            return RespBean.ok("更新成功!");
        }
        return RespBean.error("更新失败!");
    }

    @DeleteMapping("/{id}")
    public RespBean deletePositionById(@PathVariable Integer id) {
        if (positionService.deletePositionById(id) == 1) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }

    @DeleteMapping("/")
    public RespBean deletePositionsByIds(Integer[] ids) {
        if (positionService.deletePositionsByIds(ids) == ids.length) {
            return RespBean.ok("删除成功!");
        }
        return RespBean.error("删除失败!");
    }
}
