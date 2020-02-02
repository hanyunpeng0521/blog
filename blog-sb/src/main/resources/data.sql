insert into t_type(id, name)
values (1, '编程'),
       (2, '算法'),
       (3, '周记');
insert into t_tag(id, name)
values (1, 'Java'),
       (2, 'Linux'),
       (3, 'MySQL');
insert into t_user(id, username, nickname, email, avatar, password, type)
values (1, 'pingxin', '平心', 'm13839441583@163.com', 'https://s2.ax1x.com/2020/01/05/lBOWkV.png',
        '96e79218965eb72c92a549dd5a330112', 1);

insert into t_blog (id, appreciation, commentabled, content, description, first_picture, flag, published, recommend,
                    share_statement, title, views, type_id, user_id)
values (1, 1, 1, '#Spring Boot开发小而美的个人博客', '个人博客：基于Spring Boot的完整全栈式的开发套路', 'https://s2.ax1x.com/2020/01/05/lBOWkV.png',
        '', 1, 1, 1, 'Spring Boot开发小而美的个人博客', 0, 3, 1);