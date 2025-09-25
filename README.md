# MyPortfolio Flutter Web App

A modern, responsive, and visually stunning personal portfolio website built with Flutter Web. This project lets developers, designers, and tech professionals elegantly showcase their skills, projects, certifications, education, and experience—with theming (dark/light), beautiful UI, and smooth navigation.

## ✨ Features

- **Responsive Design**: Looks beautiful on desktop, tablet, and mobile.
- **Dynamic Theming**: Light/dark mode toggle with animated theme transitions.
- **Clean Navigation**: Website-style fixed navigation bar with smooth scrolling and a right-side drawer menu on mobile.
- **Rich Showcase**: Sections for About, Experience, Projects, Skills, Education, Certifications, and Contact.
- **Data-Driven**: All content (projects, skills, certifications, etc.) is defined via Dart models for easy updates.
- **Modern Animations**: Subtle hover and transition effects throughout for premium UX.

## 📸 Screenshots

### Home / About Section
![About Section](https://github.com/saisurendra6/my_portfolio/blob/main/images/about_section.png) 
![About Section Dark Mode](https://github.com/saisurendra6/my_portfolio/blob/main/images/about_section_dark_mode.png)
### Experience Section 
![Experience Section](https://github.com/saisurendra6/my_portfolio/blob/main/images/experience_section.png) 
### Projects Section
![Projects Section](https://github.com/saisurendra6/my_portfolio/blob/main/images/projects_section.png) 
Project View
![Project Model](https://github.com/saisurendra6/my_portfolio/blob/main/images/project_view.png) 
### Skills Section
![Skills Section](https://github.com/saisurendra6/my_portfolio/blob/main/images/skill_section.png) 
### Education and Certifications Section
![Education and Certifications Section](https://github.com/saisurendra6/my_portfolio/blob/main/images/education_certification_section.png) 
### Contact Section
![Contact Section](https://github.com/saisurendra6/my_portfolio/blob/main/images/contact_me_section.png) 

## Structure

```
lib/
│
├── main.dart
├── constants/
│     └── colors.dart
├── models/
│     └── portfolio_data.dart
├── providers/
│     └── theme_provider.dart
├── utils/
│     └── utils.dart
├── views/
│     └── home_page.dart
├── widgets/
│     ├── certification_card.dart
│     ├── contact_section.dart
│     ├── custom_button.dart
│     ├── education_card.dart
│     ├── experience_card.dart
│     ├── nav_bar.dart
│     ├── project_card.dart
│     ├── project_model.dart
│     └── skill_card.dart
```

## 📝 How to Run

1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/my_portfolio.git
   cd my_portfolio
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run in Chrome/Web:**
   ```sh
   flutter run -d chrome
   ```

## 🎨 Customization

- **Update Your Data:**  
  Open `lib/models/portfolio_data.dart` and fill in your:
  - Name, bio, avatar, contact info
  - Projects (title, description, tech stack, links, images)
  - Skills, education, experience, certifications  
- **Change Theme Colours:**  
  Edit `lib/constants/colors.dart` and `lib/providers/theme_provider.dart` for branding.


## 🧑‍💻 Tech Stack

- Flutter Web (`stable` channel)
- Material Design 3 & Custom Theming
- Responsive UI
- Packages: `font_awesome_flutter`, `url_launcher`, etc.

## 🖼️ Custom Section Gallery

| Section         | Screenshot Link                                                                                                  |
|-----------------|------------------------------------------------------------------------------------------------------------------|
| About           | (https://github.com/saisurendra6/my_portfolio/blob/main/images/about_section.png)                                |
| Experience      | (https://github.com/saisurendra6/my_portfolio/blob/main/images/experience_section.png)                           |
| Projects        | (https://github.com/saisurendra6/my_portfolio/blob/main/images/projects_section.png)                             |
| Skills          | (https://github.com/saisurendra6/my_portfolio/blob/main/images/skills_section.png)                               |
| Education       | (https://github.com/saisurendra6/my_portfolio/blob/main/images/education_certification_section.png)              |
| Certifications  | (https://github.com/saisurendra6/my_portfolio/blob/main/images/education_certification_section.png)              |
| Contact         | (https://github.com/saisurendra6/my_portfolio/blob/main/images/contact_me_section.png)                           |
| Project Model   | (https://github.com/saisurendra6/my_portfolio/blob/main/images/project_view.png)                                 |


## 📦 Deployment
Deploy easily to GitHub Pages, Vercel, Netlify, or your own server:
- Build: `flutter build web`
- Deploy `build/web` output directory as static site.

## 📄 License
Feel free to fork and use as your portfolio's foundation!


**Showcase your skills—beautifully, blazing fast, and fully custom.**  
Happy coding! 🚀
