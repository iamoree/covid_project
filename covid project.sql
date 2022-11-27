Select Location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..['owid-covid-data$']
where continent is not null
order by 1,2

--looking at total cases vs total deaths
Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as Deathpercentage
from PortfolioProject..['owid-covid-data$']
where location like '%states%'
order by 1,2

--total cases vs population
Select Location, date, population, total_cases, (total_cases/population)*100 as percentpopulation
from PortfolioProject..['owid-covid-data$']
--where location like '%states%'
order by 1,2

Select Location, population, max(total_cases) as HighestInfectionCount, max((total_cases)/population )*100 as percentPopulationInfected
from PortfolioProject..['owid-covid-data$']
Group by Location, population
order by 1,2

--countries with highest death count per population
Select location, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..['owid-covid-data$']
where continent is not null
Group by location
order by TotalDeathCount desc

--highest death count by continent
Select location, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..['owid-covid-data$']
where continent is null
Group by location
order by TotalDeathCount desc

--grouping total in the world by each date
Select date, SUM(new_cases) as Total_Cases, SUM( cast(new_deaths as int)) as Total_Deaths, SUM(cast(new_deaths as int)) / SUM(New_cases)*100 as Deathpercentage 
from PortfolioProject..['owid-covid-data$']
where continent is not null
Group by date
order by 1, 2

--grouping total in the world
Select SUM(new_cases) as Total_Cases, SUM( cast(new_deaths as int)) as Total_Deaths, SUM(cast(new_deaths as int)) / SUM(new_cases)*100 as Deathpercentage 
from PortfolioProject..['owid-covid-data$']
where continent is not null
order by 1, 2