/**
 * VOLTRONET - Bilingual Localization & UI Controller (RO / EN)
 */

const translations = {
    ro: {
        brandSub: "Soluții Cloud & DevOps",
        navServices: "Servicii",
        navSolutions: "Soluții & Cazuri",
        navTech: "Tehnologii",
        navMethod: "Metodologie",
        navContact: "Contact",
        btnConsulting: "Programează Consultanță",
        heroBadge: "ENTERPRISE CLOUD ARCHITECTURE & DEVOPS",
        heroTitle: "Infrastructură Cloud <span class=\"gradient-text\">Fără Compromisuri</span> și Scalabilitate Nativa.",
        heroSubtitle: "Conectăm stiva ta tehnologică la performanța pe care o cere businessul tău. Soluții personalizate end-to-end: migrare cloud fără întreruperi, automatizare completă IaC și sisteme cu disponibilitate ridicată (99.99%).",
        btnInit: "Discută cu un Inginer",
        btnExplore: "Vezi Scenariile Livrate",
        statUptime: "Uptime Garantat",
        statDowntime: "Downtime la Deploy",
        statIac: "Control prin Cod (IaC)",
        termInit: "# Initializing VOLTRONET Cloud Architecture Blueprint...",
        termOk1: "Provisioning VPC & Subnets (Multi-AZ)...",
        termOk2: "Deploying EKS Cluster with Karpenter Autoscaler...",
        termOk3: "Configuring Vault Secrets Management & KMS keys...",
        termOk4: "Enabling Datadog APM & CloudWatch Alarms...",
        termOk5: "Cloudflare WAF & Argo Tunnels Attached.",
        termStatus: "Status: INFRASTRUCTURE READY",
        termSub: "Zero security flaws detected • Standard compliance met",
        servTag: "Expertiză Tehnică & Business Value",
        servTitle: "Servicii De Inginerie Infrastructure & Cloud",
        servDesc: "Construim fundația tehnică de care are nevoie afacerea ta pentru a crește fără limitări, optimizând costurile și garantând securitatea la nivel enterprise.",
        s1Title: "Cloud & Infrastructure Engineering",
        s1Desc: "Proiectăm și gestionăm infrastructuri Cloud Native scalabile în AWS și GCP. Implementăm containerizare de nivel enterprise, orchestrare cu Kubernetes și declarative Infrastructure as Code.",
        s1Li1: "Terraform & Ansible Infrastructure Automation",
        s1Li2: "Container Orchestration (Docker, Kubernetes, Kind)",
        s1Li3: "Multi-Region High Availability & Disaster Recovery",
        s2Title: "DevOps Automation & GitOps",
        s2Desc: "Eliminăm blocajele de livrare software prin pipelines CI/CD automatizate. Implementăm principii GitOps pentru sincronizarea stării din depozit cu mediul live de producție.",
        s2Li1: "GitHub Actions & Jenkins Automated Pipelines",
        s2Li2: "Continuous Deployment cu FluxCD & ArgoCD",
        s2Li3: "Automated Code Quality & Static Analysis (SonarQube)",
        s3Title: "Observability, APM & Security",
        s3Desc: "Transformăm metricele și logurile complexe în vizibilitate completă. Protejăm microserviciile și datele sensibile utilizând management centralizat al secretelor și API Gateways.",
        s3Li1: "Datadog, Prometheus & CloudWatch Telemetry",
        s3Li2: "HashiCorp Vault Secrets Management & KMS",
        s3Li3: "Cloudflare Tunnels, WAF & Kong API Gateway",
        s4Title: "Cloud Migration & Modernization",
        s4Desc: "Transformăm și migrăm aplicațiile moștenite (on-premises) către arhitecturi moderne cloud-native. Evaluăm infrastructura existentă, refactorizăm workloads și optimizăm costurile.",
        s4Li1: "On-Premises to Multi-Cloud Architecture & Migration",
        s4Li2: "Workload Lift-and-Shift & Cloud Native Refactoring",
        s4Li3: "Performance Optimization & Cost Reduction Tuning",
        solTag: "Scenarii & Cazuri de Utilizare",
        solTitle: "Cum Rezolvăm Provocările Tale Reale",
        solDesc: "Fiecare business are un punct critic în infrastructură. Iată unde intervenim cel mai des pentru a aduce stabilitate și viteză.",
        uc1Title: "Migrări Fără Risc",
        uc1Desc: "Trecerea de la servere fizice locale (On-Premises) sau alte medii spre Cloud (AWS/GCP) fără întreruperea activității pentru clienții tăi.",
        uc2Title: "Viteză în Livrare (CI/CD)",
        uc2Desc: "Reducerea timpului de la scrierea codului până la rularea în producție de la ore la câteva minute, cu testare automată prin SonarQube și GitOps."
    },
    en: {
        brandSub: "Cloud & DevOps Solutions",
        navServices: "Services",
        navSolutions: "Solutions & Cases",
        navTech: "Technologies",
        navMethod: "Methodology",
        navContact: "Contact",
        btnConsulting: "Schedule Consulting",
        heroBadge: "ENTERPRISE CLOUD ARCHITECTURE & DEVOPS",
        heroTitle: "Uncompromised <span class=\"gradient-text\">Cloud Architecture</span> & Native Scalability.",
        heroSubtitle: "We connect your technology stack to the performance your business demands. End-to-end custom solutions: seamless cloud migration, complete IaC automation, and high-availability systems (99.99%).",
        btnInit: "Talk to an Engineer",
        btnExplore: "View Delivered Scenarios",
        statUptime: "Guaranteed Uptime",
        statDowntime: "Deploy Downtime",
        statIac: "Infrastructure as Code",
        termInit: "# Initializing VOLTRONET Cloud Architecture Blueprint...",
        termOk1: "Provisioning VPC & Subnets (Multi-AZ)...",
        termOk2: "Deploying EKS Cluster with Karpenter Autoscaler...",
        termOk3: "Configuring Vault Secrets Management & KMS keys...",
        termOk4: "Enabling Datadog APM & CloudWatch Alarms...",
        termOk5: "Cloudflare WAF & Argo Tunnels Attached.",
        termStatus: "Status: INFRASTRUCTURE READY",
        termSub: "Zero security flaws detected • Standard compliance met",
        servTag: "Technical Expertise & Business Value",
        servTitle: "Infrastructure & Cloud Engineering Services",
        servDesc: "We build the technical foundation your business needs to grow without limits, optimizing costs and ensuring enterprise-grade security.",
        s1Title: "Cloud & Infrastructure Engineering",
        s1Desc: "We design and manage scalable Cloud Native infrastructures in AWS and GCP. We implement enterprise containerization, Kubernetes orchestration, and declarative Infrastructure as Code.",
        s1Li1: "Terraform & Ansible Infrastructure Automation",
        s1Li2: "Container Orchestration (Docker, Kubernetes, Kind)",
        s1Li3: "Multi-Region High Availability & Disaster Recovery",
        s2Title: "DevOps Automation & GitOps",
        s2Desc: "We eliminate software delivery bottlenecks through automated CI/CD pipelines. We implement GitOps principles to synchronize repository state with live production.",
        s2Li1: "GitHub Actions & Jenkins Automated Pipelines",
        s2Li2: "Continuous Deployment with FluxCD & ArgoCD",
        s2Li3: "Automated Code Quality & Static Analysis (SonarQube)",
        s3Title: "Observability, APM & Security",
        s3Desc: "We turn complex metrics and logs into complete visibility. We protect microservices and sensitive data using centralized secret management and API Gateways.",
        s3Li1: "Datadog, Prometheus & CloudWatch Telemetry",
        s3Li2: "HashiCorp Vault Secrets Management & KMS",
        s3Li3: "Cloudflare Tunnels, WAF & Kong API Gateway",
        s4Title: "Cloud Migration & Modernization",
        s4Desc: "We transform and migrate legacy on-premises applications to modern cloud-native architectures. We assess existing infrastructure, refactor workloads, and optimize costs.",
        s4Li1: "On-Premises to Multi-Cloud Architecture & Migration",
        s4Li2: "Workload Lift-and-Shift & Cloud Native Refactoring",
        s4Li3: "Performance Optimization & Cost Reduction Tuning",
        solTag: "Scenarios & Use Cases",
        solTitle: "How We Solve Your Real Infrastructure Challenges",
        solDesc: "Every business has a critical infrastructure bottleneck. Here is where we step in most often to bring stability and velocity.",
        uc1Title: "Risk-Free Migrations",
        uc1Desc: "Transitioning from local physical servers (On-Premises) or other environments to the Cloud (AWS/GCP) without business disruption for your clients.",
        uc2Title: "Delivery Velocity (CI/CD)",
        uc2Desc: "Reducing lead time from code commit to production deployment from hours to minutes, with automated testing via SonarQube and GitOps."
    }
};

document.addEventListener("DOMContentLoaded", () => {
    // 1. Gestionarea limbii curente (Implicit RO sau ce este salvat)
    let currentLang = localStorage.getItem("voltronet_lang") || "ro";

    const setLanguage = (lang) => {
        currentLang = lang;
        localStorage.setItem("voltronet_lang", lang);
        document.documentElement.lang = lang;

        // Actualizează textul pe butoanele de comutare
        const nextLangText = lang === "ro" ? "EN" : "RO";
        const langTextEl = document.getElementById("lang-text");
        const langTextMobEl = document.getElementById("lang-text-mob");
        
        if (langTextEl) langTextEl.textContent = nextLangText;
        if (langTextMobEl) langTextMobEl.textContent = nextLangText;

        // Înlocuiește textele pe elementele marcate cu data-i18n
        document.querySelectorAll("[data-i18n]").forEach((el) => {
            const key = el.getAttribute("data-i18n");
            if (translations[lang] && translations[lang][key]) {
                el.innerHTML = translations[lang][key];
            }
        });
    };

    // Setează limba inițială la încărcarea paginii
    setLanguage(currentLang);

    // Event listener pentru butoanele de comutare limbă (Desktop & Mobile)
    const toggleLang = () => {
        const newLang = currentLang === "ro" ? "en" : "ro";
        setLanguage(newLang);
    };

    const langSwitchBtn = document.getElementById("lang-switch");
    const langSwitchMobBtn = document.getElementById("lang-switch-mob");

    if (langSwitchBtn) langSwitchBtn.addEventListener("click", toggleLang);
    if (langSwitchMobBtn) langSwitchMobBtn.addEventListener("click", toggleLang);

    // 2. Gestionarea Meniului Mobil (Hamburger Menu)
    const mobileMenuBtn = document.getElementById("mobile-menu-btn");
    const mobileMenu = document.getElementById("mobile-menu");

    if (mobileMenuBtn && mobileMenu) {
        mobileMenuBtn.addEventListener("click", () => {
            mobileMenu.classList.toggle("hidden");
        });

        // Închide meniul la click pe orice link din meniul mobil
        mobileMenu.querySelectorAll("a").forEach((link) => {
            link.addEventListener("click", () => {
                mobileMenu.classList.add("hidden");
            });
        });
    }
});
