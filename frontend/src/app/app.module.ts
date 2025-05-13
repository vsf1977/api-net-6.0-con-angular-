import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { DxDataGridModule, DxFormModule, DxButtonModule } from 'devextreme-angular';
import { AppComponent } from './app.component';
import { DxHttpModule } from 'devextreme-angular/http';
import { AppRoutingModule } from './app-routing.module';
import { NavbarComponent } from './components/navbar/navbar.component';
import { provideHttpClient } from '@angular/common/http';
import { InfoComponent } from './components/info/info.component';
import { DataService } from '../app/services/data.service';


@NgModule({
  declarations: [
    AppComponent,
    InfoComponent,
  ],
  imports: [
    BrowserModule,
    DxHttpModule,
    AppRoutingModule,
    DxDataGridModule, DxFormModule, DxButtonModule,
    NavbarComponent,
  ],
  providers: [
    provideHttpClient(),DataService
  ],
  bootstrap: [AppComponent],
})
export class AppModule { }
