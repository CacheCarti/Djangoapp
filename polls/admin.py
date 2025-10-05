# # from django.contrib import admin

# # from .models import Question

# # admin.site.register(Question)
# # # Register your models here.
# from django.contrib import admin
# from .models import Question, Choice

# class ChoiceInline(admin.TabularInline):  # or admin.StackedInline for vertical layout
#     model = Choice
#     extra = 3  # number of empty choice forms shown by default

# class QuestionAdmin(admin.ModelAdmin):
#     fieldsets = [
#         (None, {'fields': ['question_text']}),
#         ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
#     ]
#     inlines = [ChoiceInline]

# admin.site.register(Question, QuestionAdmin)



from django.contrib import admin
from .models import Question, Choice

class ChoiceInline(admin.TabularInline):  # or admin.StackedInline for vertical layout
    model = Choice
    extra = 3  # number of empty choice forms shown by default

class QuestionAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['question_text']}),
        ('Date information', {'fields': ['pub_date'], 'classes': ['collapse']}),
    ]
    inlines = [ChoiceInline]

admin.site.register(Question, QuestionAdmin)

