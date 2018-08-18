import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component';
import { RegisterComponent } from './pages/register/register.component';
import { AboutComponent } from './pages/about/about.component';
import { ContactComponent } from './pages/contact/contact.component';
import ProizvodiComponent from './pages/proizvodi/proizvodi.component';
import { ProductComponent } from './pages/product/product.component';
import { KorpaComponent } from './pages/korpa/korpa.component';
import AdminComponent from './pages/admin/admin.component';



const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'about', component: AboutComponent },
  { path: 'contact', component: ContactComponent },
  { path: 'proizvodi', component: ProizvodiComponent },
  { path: 'product/:id', component: ProductComponent },
  { path: "korpa", component: KorpaComponent },
  { path: "admin", component: AdminComponent },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
