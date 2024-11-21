-- 创建一个新的数据库，名为dependency_manager
-- 如果数据库已存在，则此语句不会执行任何操作
CREATE DATABASE IF NOT EXISTS dependency_manager;

-- 使用dependency_manager数据库
USE dependency_manager;

-- 创建一个名为dependencies的表
-- 该表将存储依赖环境的元数据
CREATE TABLE dependencies (
    -- id列作为主键，自动增长，用于唯一标识每个依赖项
    id INT AUTO_INCREMENT PRIMARY KEY,
    -- label列用于存储依赖项的标签，不得为空
    label VARCHAR(255) NOT NULL,
    -- comment列用于存储关于依赖项的额外备注或描述
    comment TEXT,
    -- dependency列用于存储依赖项的名称或标识，不得为空
    dependency VARCHAR(255) NOT NULL,
    -- prerequisite列用于存储依赖项的前置依赖
    prerequisite VARCHAR(255),
    -- usage_instructions列用于存储依赖项的使用说明或安装指南
    usage_instructions TEXT,
    -- deployment_script列用于存储一键部署脚本的路径或内容
    deployment_script TEXT,
    -- created_at列用于存储记录的创建时间，默认为当前时间戳
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- updated_at列用于存储记录的最后一次更新时间，默认为当前时间戳，并且在每次更新记录时自动更新
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 创建索引以提高基于标签和依赖名称的查询效率
-- 这将帮助加快WHERE label = 'some_label'和WHERE dependency = 'some_dependency'的查询速度
CREATE INDEX idx_label ON dependencies (label);
CREATE INDEX idx_dependency ON dependencies (dependency);