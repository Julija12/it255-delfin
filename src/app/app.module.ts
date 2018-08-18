import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AngularFontAwesomeModule } from "angular-font-awesome";
import { AppRoutingModule } from './app-routing.module';
import { NgbModule } from "@ng-bootstrap/ng-bootstrap";
import { AppComponent } from './app.component';
import { HomeComponent } from './pages/home/home.component';
import { NgbdCarouselBasic } from "./pages/home/carousel/carousel-basic";
import { LoginComponent } from './pages/login/login.component';
import { RegisterComponent } from './pages/register/register.component';
import { HttpModule } from '@angular/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RegisterService } from './services/register.service';
import { LoginService } from './services/login.service';
import { UserService } from './services/user.service';
import { AboutComponent } from './pages/about/about.component';
import { ContactComponent } from './pages/contact/contact.component';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import ProizvodiComponent from './pages/proizvodi/proizvodi.component';
import ProizvodiService from './services/proizvodi.service';
import ProizvodService from './services/proizvod.service';
import { ProductComponent } from './pages/product/product.component';
import { KorpaComponent } from './pages/korpa/korpa.component';
import { KorpaService } from './services/korpa.service';
import { SharedService } from './services/shared.service';
import AdminComponent from './pages/admin/admin.component';
import { AdminService } from './services/admin.service';
import NarudzbineService from './services/narudzbine.service';




@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    NgbdCarouselBasic,
    LoginComponent,
    RegisterComponent,
    AboutComponent,
    ContactComponent,
    ProizvodiComponent,
    ProductComponent,
    KorpaComponent,
    AdminComponent,
    
    
  ],
  imports: [
   
    HttpModule,
    BrowserModule,
    AppRoutingModule, 
    HttpModule,
    FormsModule,
    ReactiveFormsModule,
    NgbModule.forRoot(),
    AngularFontAwesomeModule
  ],
  providers: [RegisterService,LoginService,UserService,ProizvodiService,ProizvodService,SharedService,KorpaService,AdminService,NarudzbineService],
  bootstrap: [AppComponent]
})
export class AppModule { }