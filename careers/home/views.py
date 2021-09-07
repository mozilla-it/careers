from bakery.views import BuildableTemplateView
# from django.shortcuts import render


# Create your views here.
class HomeIndexPageTemplateView(BuildableTemplateView):
    build_path = 'index.html'
    template_name = '/app/careers/home/templates/home/home_index_page.html'
