<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('search_data', function (Blueprint $table) {
            $table->id();
            $table->string('search_value', 250)->nullable();
            $table->json('keywords')->nullable();
            $table->json('results')->nullable();
            $table->dateTime('search_time');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('search_data');
    }
};