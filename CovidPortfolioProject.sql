SELECT location,date,total_cases,new_cases,total_deaths,population
FROM PortfolioProject..CovidDeaths
ORDER BY location,date;

-- Looking at total cases vs total deaths

--show likelyhood of dying if you contract covid in your country

SELECT location,date,total_cases,total_deaths,cast(total_deaths as int) / cast(total_cases as int)*100 as death_percentage FROM PortfolioProject..CovidDeaths
WHERE location like '%States%'
ORDER BY location,date;

--looking at total cases vs population

SELECT location,date,population,total_cases,cast(total_cases as int)/(population)*100 as case_percentage FROM PortfolioProject..CovidDeaths
WHERE location like '%States%'
ORDER BY location,date;

--looking at countries with highest infection rate compared to population
SELECT location, population, MAX(Cast(total_cases as int)) as HighestInfectionCount, MAX(CAST(total_cases as int)/population)*100 as infection_percentage FROM PortfolioProject..CovidDeaths
GROUP BY location, population
ORDER BY infection_percentage desc;

--showing countries with highest death count per population

SELECT location, MAX(Cast(total_deaths as int)) as HighestDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY location
ORDER BY HighestDeathCount desc;

--showing the continents with the highest death count

SELECT continent, MAX(Cast(total_deaths as int)) as HighestDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY continent
ORDER BY HighestDeathCount desc;

--Global Numbers

SELECT SUM(Cast(new_cases as int)) as totalcases, SUM(Cast(new_deaths as int)) as total_deaths, SUM(Cast(new_deaths as int))/SUM(Cast(new_cases as int))*100 as death_percentage
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
ORDER BY 1,2;

SELECT* FROM PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVax vac
on dea.location = vac.location
and dea.date = vac.date

--looking at total population vs vaccination
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
FROM PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVax vac
On dea.location = vac.location
and dea.date = vac.date
where dea.continent is not null
order by 1,2,3;


SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,SUM(Cast(vac.new_vaccinations as bigint)) OVER(partition by dea.location ORDER BY dea.location, dea.date)
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVax vac
ON dea.location = vac.location
and dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3

--USE A CTE

WITH PopvsVax
as 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,SUM(Cast(vac.new_vaccinations as bigint)) OVER(partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVax vac
ON dea.location = vac.location
and dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3
)
SELECT *
FROM PopvsVax;

--Creating View to store data for later visualizations
Create View PercentPopulationVaccinated as
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,SUM(Cast(vac.new_vaccinations as bigint)) OVER(partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVax vac
ON dea.location = vac.location
and dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3

SELECT *
FROM PercentPopulationVaccinated