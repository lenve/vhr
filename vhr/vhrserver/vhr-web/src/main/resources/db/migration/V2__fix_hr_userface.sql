-- 头像外链已失效（百度图片缓存、千库图），统一替换为项目内置的本地头像
UPDATE `hr` SET `userface` = '/faces/men12.jpg' WHERE `username` = 'admin';
UPDATE `hr` SET `userface` = '/faces/men32.jpg' WHERE `username` = 'libai';
UPDATE `hr` SET `userface` = '/faces/men44.jpg' WHERE `username` = 'hanyu';
UPDATE `hr` SET `userface` = '/faces/men52.jpg' WHERE `username` = 'liuzongyuan';
UPDATE `hr` SET `userface` = '/faces/men68.jpg' WHERE `username` = 'zenggong';
