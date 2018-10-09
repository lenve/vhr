package org.sang.common.poi;

import org.apache.poi.hpsf.DocumentSummaryInformation;
import org.apache.poi.hpsf.SummaryInformation;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.sang.bean.*;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by sang on 2018/1/16.
 */
public class PoiUtils {

    public static ResponseEntity<byte[]> exportEmp2Excel(List<Employee> emps) {
        HttpHeaders headers = null;
        ByteArrayOutputStream baos = null;
        try {
            //1.创建Excel文档
            HSSFWorkbook workbook = new HSSFWorkbook();
            //2.创建文档摘要
            workbook.createInformationProperties();
            //3.获取文档信息，并配置
            DocumentSummaryInformation dsi = workbook.getDocumentSummaryInformation();
            //3.1文档类别
            dsi.setCategory("员工信息");
            //3.2设置文档管理员
            dsi.setManager("江南一点雨");
            //3.3设置组织机构
            dsi.setCompany("XXX集团");
            //4.获取摘要信息并配置
            SummaryInformation si = workbook.getSummaryInformation();
            //4.1设置文档主题
            si.setSubject("员工信息表");
            //4.2.设置文档标题
            si.setTitle("员工信息");
            //4.3 设置文档作者
            si.setAuthor("XXX集团");
            //4.4设置文档备注
            si.setComments("备注信息暂无");
            //创建Excel表单
            HSSFSheet sheet = workbook.createSheet("XXX集团员工信息表");
            //创建日期显示格式
            HSSFCellStyle dateCellStyle = workbook.createCellStyle();
            dateCellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));
            //创建标题的显示样式
            HSSFCellStyle headerStyle = workbook.createCellStyle();
            headerStyle.setFillForegroundColor(IndexedColors.YELLOW.index);
            headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            //定义列的宽度
            sheet.setColumnWidth(0, 5 * 256);
            sheet.setColumnWidth(1, 12 * 256);
            sheet.setColumnWidth(2, 10 * 256);
            sheet.setColumnWidth(3, 5 * 256);
            sheet.setColumnWidth(4, 12 * 256);
            sheet.setColumnWidth(5, 20 * 256);
            sheet.setColumnWidth(6, 10 * 256);
            sheet.setColumnWidth(7, 10 * 256);
            sheet.setColumnWidth(8, 16 * 256);
            sheet.setColumnWidth(9, 12 * 256);
            sheet.setColumnWidth(10, 15 * 256);
            sheet.setColumnWidth(11, 20 * 256);
            sheet.setColumnWidth(12, 16 * 256);
            sheet.setColumnWidth(13, 14 * 256);
            sheet.setColumnWidth(14, 14 * 256);
            sheet.setColumnWidth(15, 12 * 256);
            sheet.setColumnWidth(16, 8 * 256);
            sheet.setColumnWidth(17, 16 * 256);
            sheet.setColumnWidth(18, 20 * 256);
            sheet.setColumnWidth(19, 12 * 256);
            sheet.setColumnWidth(20, 8 * 256);
            sheet.setColumnWidth(21, 25 * 256);
            sheet.setColumnWidth(22, 14 * 256);
            sheet.setColumnWidth(23, 12 * 256);
            sheet.setColumnWidth(24, 12 * 256);
            //5.设置表头
            HSSFRow headerRow = sheet.createRow(0);
            HSSFCell cell0 = headerRow.createCell(0);
            cell0.setCellValue("编号");
            cell0.setCellStyle(headerStyle);
            HSSFCell cell1 = headerRow.createCell(1);
            cell1.setCellValue("姓名");
            cell1.setCellStyle(headerStyle);
            HSSFCell cell2 = headerRow.createCell(2);
            cell2.setCellValue("工号");
            cell2.setCellStyle(headerStyle);
            HSSFCell cell3 = headerRow.createCell(3);
            cell3.setCellValue("性别");
            cell3.setCellStyle(headerStyle);
            HSSFCell cell4 = headerRow.createCell(4);
            cell4.setCellValue("出生日期");
            cell4.setCellStyle(headerStyle);
            HSSFCell cell5 = headerRow.createCell(5);
            cell5.setCellValue("身份证号码");
            cell5.setCellStyle(headerStyle);
            HSSFCell cell6 = headerRow.createCell(6);
            cell6.setCellValue("婚姻状况");
            cell6.setCellStyle(headerStyle);
            HSSFCell cell7 = headerRow.createCell(7);
            cell7.setCellValue("民族");
            cell7.setCellStyle(headerStyle);
            HSSFCell cell8 = headerRow.createCell(8);
            cell8.setCellValue("籍贯");
            cell8.setCellStyle(headerStyle);
            HSSFCell cell9 = headerRow.createCell(9);
            cell9.setCellValue("政治面貌");
            cell9.setCellStyle(headerStyle);
            HSSFCell cell10 = headerRow.createCell(10);
            cell10.setCellValue("电话号码");
            cell10.setCellStyle(headerStyle);
            HSSFCell cell11 = headerRow.createCell(11);
            cell11.setCellValue("联系地址");
            cell11.setCellStyle(headerStyle);
            HSSFCell cell12 = headerRow.createCell(12);
            cell12.setCellValue("所属部门");
            cell12.setCellStyle(headerStyle);
            HSSFCell cell13 = headerRow.createCell(13);
            cell13.setCellValue("职称");
            cell13.setCellStyle(headerStyle);
            HSSFCell cell14 = headerRow.createCell(14);
            cell14.setCellValue("职位");
            cell14.setCellStyle(headerStyle);
            HSSFCell cell15 = headerRow.createCell(15);
            cell15.setCellValue("聘用形式");
            cell15.setCellStyle(headerStyle);
            HSSFCell cell16 = headerRow.createCell(16);
            cell16.setCellValue("最高学历");
            cell16.setCellStyle(headerStyle);
            HSSFCell cell17 = headerRow.createCell(17);
            cell17.setCellValue("专业");
            cell17.setCellStyle(headerStyle);
            HSSFCell cell18 = headerRow.createCell(18);
            cell18.setCellValue("毕业院校");
            cell18.setCellStyle(headerStyle);
            HSSFCell cell19 = headerRow.createCell(19);
            cell19.setCellValue("入职日期");
            cell19.setCellStyle(headerStyle);
            HSSFCell cell20 = headerRow.createCell(20);
            cell20.setCellValue("在职状态");
            cell20.setCellStyle(headerStyle);
            HSSFCell cell21 = headerRow.createCell(21);
            cell21.setCellValue("邮箱");
            cell21.setCellStyle(headerStyle);
            HSSFCell cell22 = headerRow.createCell(22);
            cell22.setCellValue("合同期限(年)");
            cell22.setCellStyle(headerStyle);
            HSSFCell cell23 = headerRow.createCell(23);
            cell23.setCellValue("合同起始日期");
            cell23.setCellStyle(headerStyle);
            HSSFCell cell24 = headerRow.createCell(24);
            cell24.setCellValue("合同终止日期");
            cell24.setCellStyle(headerStyle);
            //6.装数据
            for (int i = 0; i < emps.size(); i++) {
                HSSFRow row = sheet.createRow(i + 1);
                Employee emp = emps.get(i);
                row.createCell(0).setCellValue(emp.getId());
                row.createCell(1).setCellValue(emp.getName());
                row.createCell(2).setCellValue(emp.getWorkID());
                row.createCell(3).setCellValue(emp.getGender());
                HSSFCell birthdayCell = row.createCell(4);
                birthdayCell.setCellValue(emp.getBirthday());
                birthdayCell.setCellStyle(dateCellStyle);
                row.createCell(5).setCellValue(emp.getIdCard());
                row.createCell(6).setCellValue(emp.getWedlock());
                row.createCell(7).setCellValue(emp.getNation().getName());
                row.createCell(8).setCellValue(emp.getNativePlace());
                row.createCell(9).setCellValue(emp.getPoliticsStatus().getName());
                row.createCell(10).setCellValue(emp.getPhone());
                row.createCell(11).setCellValue(emp.getAddress());
                row.createCell(12).setCellValue(emp.getDepartment().getName());
                row.createCell(13).setCellValue(emp.getJobLevel().getName());
                row.createCell(14).setCellValue(emp.getPosition().getName());
                row.createCell(15).setCellValue(emp.getEngageForm());
                row.createCell(16).setCellValue(emp.getTiptopDegree());
                row.createCell(17).setCellValue(emp.getSpecialty());
                row.createCell(18).setCellValue(emp.getSchool());
                HSSFCell beginDateCell = row.createCell(19);
                beginDateCell.setCellValue(emp.getBeginDate());
                beginDateCell.setCellStyle(dateCellStyle);
                row.createCell(20).setCellValue(emp.getWorkState());
                row.createCell(21).setCellValue(emp.getEmail());
                row.createCell(22).setCellValue(emp.getContractTerm());
                HSSFCell beginContractCell = row.createCell(23);
                beginContractCell.setCellValue(emp.getBeginContract());
                beginContractCell.setCellStyle(dateCellStyle);
                HSSFCell endContractCell = row.createCell(24);
                endContractCell.setCellValue(emp.getEndContract());
                endContractCell.setCellStyle(dateCellStyle);
            }
            headers = new HttpHeaders();
            headers.setContentDispositionFormData("attachment",
                    new String("员工表.xls".getBytes("UTF-8"), "iso-8859-1"));
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            baos = new ByteArrayOutputStream();
            workbook.write(baos);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new ResponseEntity<byte[]>(baos.toByteArray(), headers, HttpStatus.CREATED);
    }

    public static List<Employee> importEmp2List(MultipartFile file,
                                                List<Nation> allNations,
                                                List<PoliticsStatus> allPolitics,
                                                List<Department> allDeps,
                                                List<Position> allPos,
                                                List<JobLevel> allJobLevels) {
        List<Employee> emps = new ArrayList<>();
        try {
        HSSFWorkbook workbook =
                new HSSFWorkbook(new POIFSFileSystem(file.getInputStream()));
        int numberOfSheets = workbook.getNumberOfSheets();
        for (int i = 0; i < numberOfSheets; i++) {
        HSSFSheet sheet = workbook.getSheetAt(i);
        int physicalNumberOfRows = sheet.getPhysicalNumberOfRows();
        Employee employee;
        for (int j = 0; j < physicalNumberOfRows; j++) {
        if (j == 0) {
            continue;//标题行
        }
        HSSFRow row = sheet.getRow(j);
        if (row == null) {
            continue;//没数据
        }
        int physicalNumberOfCells = row.getPhysicalNumberOfCells();
        employee = new Employee();
        for (int k = 0; k < physicalNumberOfCells; k++) {
        HSSFCell cell = row.getCell(k);
        switch (cell.getCellTypeEnum()) {
        case STRING: {
            String cellValue = cell.getStringCellValue();
            if (cellValue == null) {
                cellValue = "";
            }
            switch (k) {
                case 1:
                    employee.setName(cellValue);
                    break;
                case 2:
                    employee.setWorkID(cellValue);
                    break;
                case 3:
                    employee.setGender(cellValue);
                    break;
                case 5:
                    employee.setIdCard(cellValue);
                    break;
                case 6:
                    employee.setWedlock(cellValue);
                    break;
                case 7:
                    int nationIndex = allNations.indexOf(new Nation(cellValue));
                    employee.setNationId(allNations.get(nationIndex).getId());
                    break;
                case 8:
                    employee.setNativePlace(cellValue);
                    break;
                case 9:
                    int psIndex = allPolitics.indexOf(new PoliticsStatus(cellValue));
                    employee.setPoliticId(allPolitics.get(psIndex).getId());
                    break;
                case 10:
                    employee.setPhone(cellValue);
                    break;
                case 11:
                    employee.setAddress(cellValue);
                    break;
                case 12:
                    int depIndex = allDeps.indexOf(new Department(cellValue));
                    employee.setDepartmentId(allDeps.get(depIndex).getId());
                    break;
                case 13:
                    int jlIndex = allJobLevels.indexOf(new JobLevel(cellValue));
                    employee.setJobLevelId(allJobLevels.get(jlIndex).getId());
                    break;
                case 14:
                    int posIndex = allPos.indexOf(new Position(cellValue));
                    employee.setPosId(allPos.get(posIndex).getId());
                    break;
                case 15:
                    employee.setEngageForm(cellValue);
                    break;
                case 16:
                    employee.setTiptopDegree(cellValue);
                    break;
                case 17:
                    employee.setSpecialty(cellValue);
                    break;
                case 18:
                    employee.setSchool(cellValue);
                    break;
                case 19:
                case 20:
                    employee.setWorkState(cellValue);
                    break;
                case 21:
                    employee.setEmail(cellValue);
                    break;
            }
        }
        break;
        default: {
            switch (k) {
                case 4:
                    employee.setBirthday(cell.getDateCellValue());
                    break;
                case 19:
                    employee.setBeginDate(cell.getDateCellValue());
                    break;
                case 22:
                    employee.setContractTerm(cell.getNumericCellValue());
                    break;
                case 23:
                    employee.setBeginContract(cell.getDateCellValue());
                    break;
                case 24:
                    employee.setEndContract(cell.getDateCellValue());
                    break;
            }
        }
            break;
        }
        }
            emps.add(employee);
        }
        }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return emps;
    }
}
