Select *
From [Coviddeath]
where continent is not null
order by 3,4


--Select *
--From [Covid vaccination]
--order by 3,4

--Select data that we're going to be using
Select location, date,total_cases, new_cases, total_deaths,population
From [Coviddeath]
where continent is not null
order by 1,2

--Looking at total cases vs total deaths
--Shows likelihood of dying if you contract covid in your country
Select location, date,total_cases, total_deaths, (total_deaths/total_cases)*100 as Death_percentage
From [Coviddeath]
where continent is not null
order by 1,2

--Looking at total cases vs population
--Shows what percentage of population has got covid
Select location, date,total_cases, population, (total_cases/population)*100 as Cases_percentage
From [Coviddeath]
where continent is not null
order by 1,2

--Looking at countries with highest infection rate compared to population
Select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population ))*100 as Higest_Cases_percentage
From [Coviddeath]
--where location like nigeria
where continent is not null
Group by location, population
order by Higest_Cases_percentage desc

--showing the countries with the highest death count per population
Select location, population, MAX(cast (total_deaths as int)) as HighestDeath
From [Coviddeath]
--where location like nigeria
where continent is not null
Group by location, population
order by HighestDeath desc

--showing the countries with the highest death count per continent
Select continent, MAX(cast (total_deaths as int)) as HighestDeath
From [Coviddeath]
where continent is not null
Group by continent
order by HighestDeath desc

--showing the continents with the highest death count
Select continent, MAX(cast (total_deaths as int)) as HighestDeath
From [Coviddeath]
--where location like nigeria
where continent is not null
Group by continent
order by HighestDeath desc

--Global Numbers
Select date, SUM(new_cases) as totalcases, SUM(cast (new_deaths as int)) as totaldeaths, SUM(cast (new_deaths as int))/SUM(new_cases)*100 as DeathPercentage 
From [Coviddeath]
--where location like nigeria
where continent is not null
Group by date
order by DeathPercentage desc

--Global Numbers
Select SUM(new_cases) as totalcases, SUM(cast (new_deaths as int)) as totaldeaths, SUM(cast (new_deaths as int))/SUM(new_cases)*100 as DeathPercentage 
From [Coviddeath]
--where location like nigeria
where continent is not null
--Group by date
order by DeathPercentage desc


select *
from [Covid vaccination]
