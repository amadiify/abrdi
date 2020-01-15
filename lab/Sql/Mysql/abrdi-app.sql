CREATE TABLE IF NOT EXISTS `config` (
	configid BIGINT(20) auto_increment primary key, 
	sitename VARCHAR(255) , 
	default_controller VARCHAR(255) , 
	default_view VARCHAR(255) , 
	favicon VARCHAR(255) , 
	keywords TEXT , 
	description TEXT , 
	developer VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS `navigation` (
	navigationid BIGINT(20) auto_increment primary key, 
	page_name VARCHAR(255) , 
	page_link VARCHAR(255) , 
	navigationtypeid INT , 
	visible TINYINT default 1, 
	position INT default 1
);

CREATE TABLE IF NOT EXISTS `navigationtypes` (
	navigationtypeid BIGINT(20) auto_increment primary key, 
	navigationtype VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `assets` (
	assetid BIGINT(20) auto_increment primary key, 
	path VARCHAR(255) , 
	tag VARCHAR(255) default 'css', 
	visible TINYINT default 1, 
	position INT defult
);
ALTER TABLE `assets` CHANGE COLUMN position position INT default 1;
CREATE TABLE IF NOT EXISTS `assets` (
	assetid BIGINT(20) auto_increment primary key, 
	path VARCHAR(255) , 
	tag VARCHAR(255) default 'css', 
	visible TINYINT default 1, 
	position INT default 1
);
CREATE TABLE IF NOT EXISTS `containers` (
	containerid BIGINT(20) auto_increment primary key, 
	container_name VARCHAR(255) , 
	container_body TEXT
);

CREATE TABLE IF NOT EXISTS `slides` (
	slideid BIGINT(20) auto_increment primary key, 
	slide_title VARCHAR(255) , 
	slide_group VARCHAR(255) default 'homescreen', 
	slide_image VARCHAR(255) , 
	slide_btn VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `slidesAnimation` (
	slidesAnimationid BIGINT(20) auto_increment primary key, 
	slideid BIGINT , 
	content VARCHAR(255) , 
	contentWrapper VARCHAR(255)
);
ALTER TABLE `navigation` ADD parentid BIGINT AFTER position;
CREATE TABLE IF NOT EXISTS `navigation` (
	navigationid BIGINT(20) auto_increment primary key, 
	page_name VARCHAR(255) , 
	page_link VARCHAR(255) , 
	navigationtypeid INT , 
	visible TINYINT default 1, 
	position INT default 1, 
	parentid BIGINT
);
ALTER TABLE `navigation` CHANGE COLUMN parentid parentid BIGINT default 0;
CREATE TABLE IF NOT EXISTS `navigation` (
	navigationid BIGINT(20) auto_increment primary key, 
	page_name VARCHAR(255) , 
	page_link VARCHAR(255) , 
	navigationtypeid INT , 
	visible TINYINT default 1, 
	position INT default 1, 
	parentid BIGINT default 0
);
CREATE TABLE IF NOT EXISTS `images` (
	imageid BIGINT(20) auto_increment primary key, 
	image_path VARCHAR(255) , 
	alt VARCHAR(255) , 
	title VARCHAR(255) , 
	image_name VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `directives` (
	directiveid BIGINT(20) auto_increment primary key, 
	directive VARCHAR(255) , 
	directive_class VARCHAR(255) , 
	directive_method VARCHAR(255)
);
ALTER TABLE `navigation` ADD keyword VARCHAR(255) AFTER parentid;
ALTER TABLE `navigation` ADD description TEXT AFTER keyword;
ALTER TABLE `navigation` ADD page_title VARCHAR(255) AFTER description;
ALTER TABLE `navigation` ADD breadcum_title VARCHAR(255) AFTER page_title;
CREATE TABLE IF NOT EXISTS `navigation` (
	navigationid BIGINT(20) auto_increment primary key, 
	page_name VARCHAR(255) , 
	page_link VARCHAR(255) , 
	navigationtypeid INT , 
	visible TINYINT default 1, 
	position INT default 1, 
	parentid BIGINT default 0, 
	keyword VARCHAR(255) , 
	description TEXT , 
	page_title VARCHAR(255) , 
	breadcum_title VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `users` (
	userid BIGINT(20) auto_increment primary key, 
	permissionid BIGINT default 1, 
	username VARCHAR(255) , 
	password VARCHAR(255) , 
	fullname VARCHAR(255) , 
	createdby BIGINT default 0, 
	dateadded TIMESTAMP
);
CREATE TABLE IF NOT EXISTS `permission` (
	permissionid BIGINT(20) auto_increment primary key, 
	permission VARCHAR(255) , 
	permission_group TEXT default 'view'
);
ALTER TABLE `permission` CHANGE COLUMN permission_group permission_group TEXT;
CREATE TABLE IF NOT EXISTS `permission` (
	permissionid BIGINT(20) auto_increment primary key, 
	permission VARCHAR(255) , 
	permission_group TEXT
);
ALTER TABLE `users` ADD loggedinToken VARCHAR(255) AFTER dateadded;
CREATE TABLE IF NOT EXISTS `users` (
	userid BIGINT(20) auto_increment primary key, 
	permissionid BIGINT default 1, 
	username VARCHAR(255) , 
	password VARCHAR(255) , 
	fullname VARCHAR(255) , 
	createdby BIGINT default 0, 
	dateadded DATETIME default CURRENT_TIMESTAMP, 
	loggedinToken VARCHAR(255)
);
ALTER TABLE `assets` ADD siteid VARCHAR(255) AFTER position;
CREATE TABLE IF NOT EXISTS `assets` (
	assetid BIGINT(20) auto_increment primary key, 
	path VARCHAR(255) , 
	tag VARCHAR(255) default 'css', 
	visible TINYINT default 1, 
	position INT default 1, 
	siteid VARCHAR(255)
);
ALTER TABLE `config` ADD siteid VARCHAR(255) AFTER developer;
CREATE TABLE IF NOT EXISTS `config` (
	configid BIGINT(20) auto_increment primary key, 
	sitename VARCHAR(255) , 
	default_controller VARCHAR(255) , 
	default_view VARCHAR(255) , 
	favicon VARCHAR(255) , 
	keywords TEXT , 
	description TEXT , 
	developer VARCHAR(255) , 
	siteid VARCHAR(255)
);
ALTER TABLE `containers` ADD siteid VARCHAR(255) AFTER container_body;
CREATE TABLE IF NOT EXISTS `containers` (
	containerid BIGINT(20) auto_increment primary key, 
	container_name VARCHAR(255) , 
	container_body TEXT , 
	siteid VARCHAR(255)
);
ALTER TABLE `directives` ADD siteid VARCHAR(255) AFTER directive_method;
CREATE TABLE IF NOT EXISTS `directives` (
	directiveid BIGINT(20) auto_increment primary key, 
	directive VARCHAR(255) , 
	directive_class VARCHAR(255) , 
	directive_method VARCHAR(255) , 
	siteid VARCHAR(255)
);
ALTER TABLE `images` ADD siteid VARCHAR(255) AFTER image_name;
CREATE TABLE IF NOT EXISTS `images` (
	imageid BIGINT(20) auto_increment primary key, 
	image_path VARCHAR(255) , 
	alt VARCHAR(255) , 
	title VARCHAR(255) , 
	image_name VARCHAR(255) , 
	siteid VARCHAR(255)
);
ALTER TABLE `navigation` ADD siteid VARCHAR(255) AFTER breadcum_title;
CREATE TABLE IF NOT EXISTS `navigation` (
	navigationid BIGINT(20) auto_increment primary key, 
	page_name VARCHAR(255) , 
	page_link VARCHAR(255) , 
	navigationtypeid INT , 
	visible TINYINT default 1, 
	position INT default 1, 
	parentid BIGINT default 0, 
	keyword VARCHAR(255) , 
	description TEXT , 
	page_title VARCHAR(255) , 
	breadcum_title VARCHAR(255) , 
	siteid VARCHAR(255)
);
ALTER TABLE `navigationtypes` ADD siteid VARCHAR(255) AFTER navigationtype;
CREATE TABLE IF NOT EXISTS `navigationtypes` (
	navigationtypeid BIGINT(20) auto_increment primary key, 
	navigationtype VARCHAR(255) , 
	siteid VARCHAR(255)
);
ALTER TABLE `permission` ADD siteid VARCHAR(255) AFTER permission_group;
CREATE TABLE IF NOT EXISTS `permission` (
	permissionid BIGINT(20) auto_increment primary key, 
	permission VARCHAR(255) , 
	permission_group TEXT , 
	siteid VARCHAR(255)
);
ALTER TABLE `slides` ADD siteid VARCHAR(255) AFTER slide_btn;
CREATE TABLE IF NOT EXISTS `slides` (
	slideid BIGINT(20) auto_increment primary key, 
	slide_title VARCHAR(255) , 
	slide_group VARCHAR(255) default 'homescreen', 
	slide_image VARCHAR(255) , 
	slide_btn VARCHAR(255) , 
	siteid VARCHAR(255)
);
ALTER TABLE `slidesAnimation` ADD siteid VARCHAR(255) AFTER contentWrapper;
CREATE TABLE IF NOT EXISTS `slidesAnimation` (
	slidesAnimationid BIGINT(20) auto_increment primary key, 
	slideid BIGINT , 
	content VARCHAR(255) , 
	contentWrapper VARCHAR(255) , 
	siteid VARCHAR(255)
);
ALTER TABLE `users` ADD siteid VARCHAR(255) AFTER loggedinToken;
CREATE TABLE IF NOT EXISTS `users` (
	userid BIGINT(20) auto_increment primary key, 
	permissionid BIGINT default 1, 
	username VARCHAR(255) , 
	password VARCHAR(255) , 
	fullname VARCHAR(255) , 
	createdby BIGINT default 0, 
	dateadded DATETIME default CURRENT_TIMESTAMP, 
	loggedinToken VARCHAR(255) , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_assets` (
	assetid BIGINT(20) auto_increment primary key, 
	path VARCHAR(255) , 
	tag VARCHAR(255) default 'css', 
	visible TINYINT default 1, 
	position INT default 1, 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_config` (
	configid BIGINT(20) auto_increment primary key, 
	sitename VARCHAR(255) , 
	default_controller VARCHAR(255) , 
	default_view VARCHAR(255) , 
	favicon VARCHAR(255) , 
	keywords TEXT , 
	description TEXT , 
	developer VARCHAR(255) , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_containers` (
	containerid BIGINT(20) auto_increment primary key, 
	container_name VARCHAR(255) , 
	container_body TEXT , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_directives` (
	directiveid BIGINT(20) auto_increment primary key, 
	directive VARCHAR(255) , 
	directive_class VARCHAR(255) , 
	directive_method VARCHAR(255) , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_images` (
	imageid BIGINT(20) auto_increment primary key, 
	image_path VARCHAR(255) , 
	alt VARCHAR(255) , 
	title VARCHAR(255) , 
	image_name VARCHAR(255) , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_navigation` (
	navigationid BIGINT(20) auto_increment primary key, 
	page_name VARCHAR(255) , 
	page_link VARCHAR(255) , 
	navigationtypeid INT , 
	visible TINYINT default 1, 
	position INT default 1, 
	parentid BIGINT default 0, 
	keyword VARCHAR(255) , 
	description TEXT , 
	page_title VARCHAR(255) , 
	breadcum_title VARCHAR(255) , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_navigationtypes` (
	navigationtypeid BIGINT(20) auto_increment primary key, 
	navigationtype VARCHAR(255) , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_permission` (
	permissionid BIGINT(20) auto_increment primary key, 
	permission VARCHAR(255) , 
	permission_group TEXT , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_slides` (
	slideid BIGINT(20) auto_increment primary key, 
	slide_title VARCHAR(255) , 
	slide_group VARCHAR(255) default 'homescreen', 
	slide_image VARCHAR(255) , 
	slide_btn VARCHAR(255) , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_slidesAnimation` (
	slidesAnimationid BIGINT(20) auto_increment primary key, 
	slideid BIGINT , 
	content VARCHAR(255) , 
	contentWrapper VARCHAR(255) , 
	siteid VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS `Zema_users` (
	userid BIGINT(20) auto_increment primary key, 
	permissionid BIGINT default 1, 
	username VARCHAR(255) , 
	password VARCHAR(255) , 
	fullname VARCHAR(255) , 
	createdby BIGINT default 0, 
	dateadded DATETIME default CURRENT_TIMESTAMP, 
	loggedinToken VARCHAR(255) , 
	siteid VARCHAR(255)
);