# SIH'24 Project Gradsy
- Problem Statement ID - 1609
- Problem Statement - Implementation of Alumni Association platform for the university/institute
- Theme - Smart Education
- PS - Software
- Team Name - Orbit Tech

### Project Description
The project involves developing a comprehensive Alumni Association platform for the
Government Engineering College, available on both web and mobile applications. The platform will facilitate
alumni registration, networking, donations, job postings, and event management. Additionally, it will
feature advanced functionalities like AI-driven career services, a start-up incubator. The goal is to enhance
alumni engagement, foster professional connections, and support college initiatives through an innovative
and user-friendly platform.

### Project Stack

#### Frontend

1. Website
   - Svelte Kit
   - Tailwind CSS

2. Desktop
   - Wrap the website in electron
  
3. Mobile (Android & iOS)
   - Dart 3.0
   - Flutter 3.10

#### Backend

1. Database
     - PostgreSQL

2. Server
     - Expres.js

## How to get started?
  #### Frontend (Website)
    cd frontend 
    npm install
    npm run dev
  #### Frontend (Mobile)
    cd app 
    cd gradsy
    flutter doctor
    flutter pub get
    flutter run
  #### Backend
  - Expressjs  
  
        cd backend 
        npm install
        node .

  - PostgreSQL  
  
        psql -U postgres -d gradsy
        \i address/SIH24/backend/schema.sql

